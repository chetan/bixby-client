
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


    private

    def create_client
      return nil if not root
      Agent.create() # indirectly sets @client
      @client
    end
  end

end # Bixby
