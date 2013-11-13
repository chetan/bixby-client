
module Bixby
  module Monitoring

  # Update the check configuration for the specified Agent and restart the
  # monitoring daemon.
  #
  # @param [Agent] agent
  #
  # @return [CommandResponse]
    def self.update_check_config(agent)
      if agent.kind_of? Bixby::Model::Agent then
        agent = agent.id
      end
      req = JsonRequest.new("monitoring:update_check_config", [ agent ])
      return Bixby.client.exec_api(req)
    end

  end # Monitoring
end # Bixby
