
module Bixby
  module Model

    class Metric < Base

      def self.list(host_id)
        get("/hosts/#{host_id}/checks")
      end

      def self.list_for_check(host_id, check_id)
        get("/hosts/#{host_id}/checks/#{check_id}/metrics")
      end

      def self.find(id)
      end

    end

  end
end
