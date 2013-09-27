
module Bixby
  module App
    class Command

      def self.command_name(str=nil)
        @command_name = str if !str.nil?
        @command_name ||= self.name.split(/::/).last.downcase
      end

      def self.desc(str=nil)
        @desc = str if !str.nil?
        @desc
      end

      def self.match(str)
        command_name == str
      end

      def self.options
      end

    end
  end
end


