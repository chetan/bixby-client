
require "api-auth"

require "bixby-common"

require "bixby-client/platform_util"
require "bixby-client/script_util"
require "bixby-client/modules"
require "bixby-client/command"
require "bixby-client/client"

module Bixby

  class << self

    # Set the Bixby::Client to be used
    def client=(client)
      @client = client
    end

    # Get a Bixby::Client instance
    def client
      @client ||= create_client()
    end

    # Path to BIXBY_HOME
    def root
      @root ||= ENV["BIXBY_HOME"]
    end
    alias_method :home, :root

    # Helper for creating absolute paths inside BIXBY_HOME
    def path(*args)
      File.expand_path(File.join(root, *args))
    end


    private

    def create_client
      return nil if not root
      Agent.create() # indirectly sets @client
      @client
    end
  end

end # Bixby
