
module Bixby
  module App
    module Commands

      class Run < Command

        command_name "run"
        desc "Run a command in the repository"

        def run(global_options, argv)

          str = argv.shift
          scripts = find_script(str)

          if scripts.kind_of?(Array)
            if scripts.size > 1 then
              $stderr.puts "Found #{scripts.size} scripts matching '#{str}'. Please be more explicit"
              scripts.each do |s|
                puts " * #{s}"
              end
              return 1
            elsif scripts.empty? then
              $stderr.puts "No scripts matched '#{str}'. Try again"
              return 1
            end
          end

          setup_env()
          exec(scripts.shift, *argv)
        end

        # Setup the ENV for exec
        def setup_env
          # stick ourselves in RUBYLIB to speedup exec time
          ENV["RUBYLIB"] = File.expand_path("../../../..", __FILE__)
          ENV["RUBYOPT"] = '-rbixby-client/script'
        end

        def self.options
          nil
        end

        def find_script(script)
          # try to locate script
          return script if File.exists? script

          # try relative path
          root = Bixby.repo
          s = File.expand_path(File.join(root, script))
          return s if File.exists? s

          # try searching
          return find_all_files(root).find_all{ |f| f.include? script }.sort { |a,b|
            ld(script, File.basename(a)) <=> ld(script, File.basename(b))
          }
        end

        def find_all_files(path)
          ret = []
          ret += Dir.glob(File.join(path, "**/**")).find_all{ |f|
            # select only actual script files to look at
            if File.symlink? f then
              ret << find_all_files(File.expand_path(f))
            end

            !File.directory? f and
              f !~ /\.(json|test.*)|\/digest$/ and
              File.dirname(f) != path and
              File.dirname(f) !~ /\/(test|lib)$/
          }

          return ret.flatten
        end

        # Calculate the levenshtein distance between two strings
        #
        # via https://github.com/akirahrkw/levenshtein-distance
        # http://en.wikipedia.org/wiki/Levenshtein_distance
        def levenshtein_distance(a, b)
          a_len = a.length
          b_len = b.length
          d = Array.new(a_len + 1).map! {
            Array.new(b_len + 1).map!{
              0
            }
          }
          (a_len + 1).times { |i| d[i][0] = i }
          (b_len + 1).times { |i| d[0][i] = i }

          for i in 1..(a_len)
            for j in 1..(b_len)
              cost = (a[i - 1] == b[j - 1]) ? 0 : 1
              d[i][j] = [ d[i-1][j] + 1 , d[i][j-1] + 1 ,d[i-1][j-1] + cost].min
            end
          end
          d[-1][-1]
        end
        alias_method :ld, :levenshtein_distance

      end # Run
      Bixby::Client.app.commands << Run

    end
  end
end


