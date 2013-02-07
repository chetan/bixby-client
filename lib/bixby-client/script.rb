
require "bixby-client"
require "fileutils"
require "systemu"

class Object
  include Bixby::PlatformUtil
  include Bixby::ScriptUtil
  include Bixby::Log

  # override to create logger based on script name
  def log
    @log || = Logging.logger[File.basename($0)]
  end

end
