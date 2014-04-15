require 'helper'

module Bixby
module Test

  class TestPlatformUtil < TestCase

    def test_util
      if `uname` =~ /Darwin/ then
        assert FooUtil.new.osx?
        refute FooUtil.new.linux?
      end
    end

  end

  class FooUtil
    include Bixby::Script::Platform
  end

end
end
