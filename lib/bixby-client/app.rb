
require 'optparse'

require 'bixby-client'
require 'bixby-client/app/command'

module Bixby
  class Client

    class << self
      attr_accessor :app
    end

    class App

      attr_reader :global_options, :command, :commands

      def initialize
        @global_options = {}
        @commands = []
      end

      def run

        begin
          options.order!(ARGV)

          if global_options[:help] then
            display_help()
          end

        rescue Exception => ex
          exit if ex.kind_of? SystemExit
          STDERR.puts "error: #{ex}"
          STDERR.puts
          STDERR.puts parser
          exit 1
        end

        subcmd = ARGV.shift
        commands.each do |c|
          if c.match(subcmd) then
            ret = c.new.run(global_options, ARGV)
            exit (ret || 0)
          end
        end

        # if we reached here, no cmd given, show help?
        display_help()

      end

      def display_help
        puts "Usage: bixby [global options] command [command options] [arguments...]"
        puts
        puts "GLOBAL OPTIONS"
        puts options.summarize
        puts

        puts "COMMANDS"
        commands.each do |c|
          puts "    " + c.command_name + " - " + c.desc
        end

        exit 0
      end

      def options
        @options ||= OptionParser.new do |opts|
          opts.banner = nil

          opts.on_tail("-v", "--verbose", "Enable verbose output") {
            global_options[:verbose] = true
          }

          opts.on_tail("-h", "--help", "Display this help") {
            global_options[:help] = true
          }
        end
      end

    end
  end
end

Bixby::Client.app = Bixby::Client::App.new
require 'bixby-client/app/commands/run'
Bixby::Client.app.run
