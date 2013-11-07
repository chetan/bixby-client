
module Bixby
  module Model

    class Host < Base

      def self.list
        get("/hosts")
      end

      def self.find(id)
        get("/hosts/#{id}")
      end

      def self.update(id, data)
        put("/hosts/#{id}", data)
      end

      def save
        # TODO
      end

    end

  end
end
