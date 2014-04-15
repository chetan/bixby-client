
require "bixby-client/patch/shellout"

module Bixby
  module Script
    module Util

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

      # Simple wrapper around #systemu which prepends sudo to the command
      #
      # @param [Array] args
      #
      # @return [Mixlib::ShellOut]
      def sudo(*args)
        args[0] = "sudo #{args.first}"
        systemu(*args)
      end

    end
  end
end
