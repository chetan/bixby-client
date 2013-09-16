
require 'helper'

module Bixby
module Test
module Patch

class TestShellout < TestCase

  def test_patches
    cmd = Mixlib::ShellOut.new("dir")
    cmd.run_command
    assert cmd.success?
    refute cmd.fail?
  end

end

end # Pach
end # Test
end # Bixby
