
module Bixby
  module Model

    class Agent < Base

      def self.list
        get("/agents")
      end

      def self.find(id)
      end

    end

  end
end
