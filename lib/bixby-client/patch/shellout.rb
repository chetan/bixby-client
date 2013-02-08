
require "mixlib/shellout"

module Mixlib
  class ShellOut

    def success?
      exitstatus == 0
    end

    def fail?
      ! success?
    end

  end
end
