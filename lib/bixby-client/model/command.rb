
module Bixby
  module Model

    class Command < Base

      def self.list
        get("/commands")
      end

      def self.find(id)
      end

    end

  end
end
