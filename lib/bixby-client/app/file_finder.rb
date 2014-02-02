
require "fuzzy_file_finder"

module Bixby
  module App
    class FileFinder

      def initialize(root)
        @root = root
      end

      # Look for a script matchign the given [partial] filename
      #
      # @param [String] script
      #
      # @return [Array<String>] matches
      def find_script(script)
        return nil if script.nil? or script.empty?
        return script if File.exists? script

        # try relative path
        s = File.expand_path(File.join(@root, script))
        return s if File.exists? s

        # try searching
        matches = find_all_files(@root).
                    find_all { |f| f.include?("/bin/") && f.include?(script) }.
                    sort { |a,b| ld(script, File.basename(a)) <=> ld(script, File.basename(b)) }

        return matches if matches.size == 1 # only one result, just return it

        # fuzzy search
        fuzzy_matches = FuzzyFileFinder.new(@root).find(script.dup).
                          sort_by { |m| -m[:score] }.
                          map{ |f| f[:path] }.
                          find_all{ |f| keep?(f, @root) }

        # return the union of all unique matches
        return fuzzy_matches + (matches - fuzzy_matches)
      end

      def find_all_files(path)
        ret = []
        ret += Dir.glob(File.join(path, "**/**")).find_all{ |f|
          # select only actual script files to look at
          if File.symlink? f then
            ret << find_all_files(File.expand_path(f))
          end

          keep?(f, path)
        }

        return ret.flatten
      end

      def keep?(f, path)
        !File.directory? f and
          f !~ /\.(json|test.*)|\/digest$/ and
          File.dirname(f) != path and
          File.dirname(f) !~ /\/(test|lib)$/
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

    end
  end
end
