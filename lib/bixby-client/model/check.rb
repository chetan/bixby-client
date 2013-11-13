
module Bixby
  module Model

    class Check < Base

      def self.list(host_id)
        get("/hosts/#{host_id}/checks")
      end

      def self.find(id)
        get("/checks/#{id}")
      end

      def self.update(id, data)
        put("/checks/#{id}", data)
      end

      def self.destroy(id)
        delete("/checks/#{id}")
      end

    end

  end
end
