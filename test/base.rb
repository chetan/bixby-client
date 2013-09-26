
module Bixby
  class TestCase < Micron::TestCase

    def setup
      super
      setup_agent_dir()
    end

    def teardown
      super
      `rm -rf /tmp/bixby_client_test_agent`
      ENV["BIXBY_HOME"] = nil
    end

    def setup_agent_dir
      template = File.expand_path(File.join(File.dirname(__FILE__), "support", "root_dir"))
      ENV["BIXBY_HOME"] = "/tmp/bixby_client_test_agent"
      FileUtils.mkdir_p(Bixby.root)
      `cp -a #{template}/* #{Bixby.root}/`
    end

  end
end

