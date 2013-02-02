
require 'helper'

module Bixby
module Test

class TestCommand < TestCase

  def setup
    super
    # setup_existing_agent()
  end

  def test_subclasses
    assert Command.subclasses
    assert (not Command.subclasses.empty?)
    assert Command.subclasses.include? Foobar

    assert Foobar.subclasses
    assert Foobar.subclasses.include? Baz
  end

  # shouldn't throw an errors w/ no input
  def test_read_stdin
    input = Command.new.read_stdin()
    assert_equal "", input
  end

  def test_get_json_input
    json = Command.new.get_json_input()
    assert json
    assert_equal(Hash, json.class)
    assert_equal({}, json)
  end

end

class Foobar < Command
end

class Baz < Foobar
end

end # Test
end # Bixby
