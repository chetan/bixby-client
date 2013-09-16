
require 'helper'

module Bixby
module Test

class TestScriptUtil < TestCase

  include Bixby::ScriptUtil

  def setup
    super
    @old_require_paths = $:.dup
  end

  def teardown
    super
    $:.reject!{ |s| !@old_require_paths.include?(s) }
  end

  def test_use_bundle
    use_bundle "test_bundle"
    assert $:.find{ |s| s =~ %r(test_bundle/lib) }
    assert Module.const_defined?(:TestBundle)
  end

  def test_systemu
    cmd = systemu("dir")
    assert cmd
    assert cmd.success?
    refute cmd.fail?
  end

end

end # Test
end # Bixby
