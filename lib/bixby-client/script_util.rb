
require "bixby-client/script/bundle"
require "bixby-client/script/distro"
require "bixby-client/script/platform"
require "bixby-client/script/util"

module Bixby
  module ScriptUtil

    include Bixby::Script::Bundle
    include Bixby::Script::Distro
    include Bixby::Script::Platform
    include Bixby::Script::Util

  end
end
