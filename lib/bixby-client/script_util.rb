
module Bixby

  module ScriptUtil

    module UseBundle
      def use_bundle(name)
        d = File.join(Bixby.repo_path, name, "lib")
        $: << d
        if File.directory? d then
          Dir.glob(File.join(d, "*.rb")).each{ |f| require f }
        end
        $:.pop # remove temp lib
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

  end # ScriptUtil
end # Bixby

module Bixby
  extend Bixby::ScriptUtil::UseBundle
end
