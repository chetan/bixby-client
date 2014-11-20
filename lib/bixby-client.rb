
require "bixby-common"
require "bixby-auth"

require "bixby-client/script_util"
require "bixby-client/model"
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
      raise "BIXBY_HOME not set" if not root

      config_file = Bixby.path("etc", "bixby.yml")
      raise "#{config_file} not found" if not File.exists? config_file

      config = YAML.load_file(config_file)
      if not config.kind_of? Hash or
        !(config.include? "access_key" and config.include? "secret_key") then

        raise "invalid config file #{config_file}"
      end

      Bixby.manager_uri = config["manager_uri"]
      return Bixby::Client.new(config["access_key"], config["secret_key"])
    end
  end

end # Bixby
