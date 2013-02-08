
require "bixby-client/patch/shellout"

module Bixby

  module ScriptUtil

    module UseBundle

      # Load the libraries for the given bundle. Searches all available
      # repositories.
      def use_bundle(name)
        repos = Dir.glob(File.join(Bixby.repo_path, "*"))
        repos.each do |repo|
          next if not File.directory? repo

          lib = File.join(repo, name, "lib")
          $: << lib
          if File.directory? lib then
            Dir.glob(File.join(lib, "*.rb")).each{ |f| require f }
          end
        end
      end
    end

    include UseBundle

    # Reads JSON data from STDIN
    #
    # @return [Object] data found on STDIN (can be Hash, Array, String, etc)
    def get_json_input
      input = read_stdin()
      input.strip! if input
      (input.nil? or input.empty?) ? {} : MultiJson.load(input)
    end

    # Read all available data on STDIN without blocking
    # (i.e., if no data is available, none will be returned)
    #
    # @return [String] data
    def read_stdin
      buff = []
      while true do
        begin
          buff << STDIN.read_nonblock(64000)
        rescue
          break
        end
      end
      return buff.join('')
    end

    # Simple wrapper around Mixlib::ShellOut
    #
    # @param [Array] args
    #
    # @return [Mixlib::ShellOut]
    def systemu(*args)
      cmd = Mixlib::ShellOut.new(*args)
      cmd.run_command
      cmd
    end

  end # ScriptUtil
end # Bixby

module Bixby
  extend Bixby::ScriptUtil::UseBundle
end

class Object
  include Bixby::ScriptUtil::UseBundle
end
