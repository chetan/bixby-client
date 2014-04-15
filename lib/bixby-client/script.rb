
require "oj"
require "bixby-client"
require "fileutils"
require "mixlib/shellout"

Bixby::Log.setup_logger()

class Object

  include Bixby::Log
  include Bixby::ScriptUtil

  # override to create logger based on script name
  def log
    @log ||= Logging.logger[File.basename($0)]
  end

end
