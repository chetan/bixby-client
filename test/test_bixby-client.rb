require 'helper'

module Bixby
class TestBixbyClient < TestCase

  def test_client_instance
    assert Bixby.client
    assert Bixby.manager_uri
    assert URI.parse(Bixby.manager_uri)

    ENV["BIXBY_HOME"] = "/folaksdf"
    Bixby.instance_eval{ @client = nil; @root = nil }
    assert_throws(RuntimeError) do
      assert Bixby.client
    end

  end

end
end

