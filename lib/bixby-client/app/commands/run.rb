
require 'bixby-client/app/file_finder'

module Bixby
  module App
    module Commands

      class Run < Command

        command_name "run"
        desc "Run a command in the repository"

        def run(global_options, argv)

          str = argv.shift
          scripts = FileFinder.new(Bixby.repo).find_script(str)

          if scripts.nil? then
            $stderr.puts "Error: missing input"
            $stderr.puts "usage: bixby run <script> [args ...]"
            return exit 1

          elsif scripts.kind_of?(Array)

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

            # only one match
            scripts = scripts.shift
          end

          setup_env()
          exec(scripts, *argv)
        end

        # Setup the ENV for exec
        def setup_env
          # use the correct ruby bin
          path = ENV["PATH"].dup
          ruby_dir = RbConfig::CONFIG['bindir']
          if !path.include? ruby_dir then
            ENV["PATH"] = "#{ruby_dir}:#{path}"
          end

          # stick ourselves in RUBYLIB to speedup exec time
          ENV["RUBYLIB"] = File.expand_path("../../../..", __FILE__)

          # load helper script
          ENV["RUBYOPT"] = '-rbixby-client/script'
        end

        def self.options
          nil
        end

      end # Run
      Bixby::Client.app.commands << Run

    end
  end
end


