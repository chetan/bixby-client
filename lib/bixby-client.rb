
require "api-auth"

require "bixby-common"
require "bixby-client/modules"
require "bixby-client/command"
require "bixby-client/client"

module Bixby

  class << self
    def client=(client)
      @client = client
    end

    def client
      @client ||= create_client()
    end


    private

    def create_client
      return nil if not ENV["BIXBY_HOME"]
      Agent.create() # indirectly sets @client
      @client
    end
  end

end # Bixby
