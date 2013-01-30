
module Bixby
  module Inventory

    # Register an agent with the manager
    #
    # @param [String] uuid
    # @param [String] public_key
    # @param [String] hostname
    # @param [FixNum] port
    # @param [String] tenant      Name of the tenant
    # @param [String] password    Password for registering an Agent with the server
    #
    # @return [JsonResponse]
    def self.register_agent(uuid, public_key, hostname, port, tenant, password)
      # TODO these params should probably be a keyed hash instead
      params = [ uuid, public_key, hostname, port, tenant, password ]
      req = JsonRequest.new("inventory:register_agent", params)
      return Bixby::Client.new(nil, nil).exec_api(req)
    end

  end # Inventory
end # Bixby
