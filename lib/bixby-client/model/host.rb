
module Bixby
  module Model

    class Host < Base

      def self.list
        get("/hosts")
      end

      def self.find(id)
      end

    end

  end
end
