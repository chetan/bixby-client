
module Bixby
  class TestCase < MiniTest::Unit::TestCase

    def setup
      super
      ENV["BIXBY_HOME"] = File.expand_path(File.join(File.dirname(__FILE__), "support", "root_dir"))
    end

    def teardown
      super
    end

  end
end

