
module Bixby
  module Model

    class Check < Base

      def self.list(host_id)
        get("/hosts/#{host_id}/checks")
      end

      def self.find(id)
      end

    end

  end
end
