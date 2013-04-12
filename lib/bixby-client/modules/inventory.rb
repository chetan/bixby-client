
module Bixby
  module Inventory

    # Register an agent with the manager
    #
    # @param [Hash] opts
    # @option opts [String] :uuid           UUID of the host
    # @option opts [String] :public_key     Public key
    # @option opts [String] :hostname       Hostname
    # @option opts [String] :tenant         Name of the tenant
    # @option opts [String] :password       Password for registering an Agent with the server
    # @option opts [FixNum] :port           Port agent listens on (optional, default: 18000)
    # @option opts [Array<String>] :tags    List of tags to assign to host (optional)
    #
    # @return [JsonResponse]
    def self.register_agent(opts)
      req = JsonRequest.new("inventory:register_agent", opts)
      return Bixby::Client.new(nil, nil).exec_api(req)
    end

  end # Inventory
end # Bixby
