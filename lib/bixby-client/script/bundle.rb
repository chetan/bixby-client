
module Bixby
  module Script
    module Bundle

      # Load the libraries for the given bundle. Searches all available
      # repositories.
      def use_bundle(name)
        repos = Dir.glob(File.join(Bixby.repo_path, "*"))
        repos.each do |repo|
          next if not File.directory? repo

          lib = File.join(repo, name, "lib")
          $: << lib
          if File.directory? lib then
            Dir.glob(File.join(lib, "*.rb")).each{ |f| require f }
          end
        end
      end

    end # Bundle
  end # Script
end # Bixby

module Bixby
  # Bixby.use_bundle
  extend Bixby::Script::Bundle
end

class Object
  # naked use_bundle "foo" in scripts
  include Bixby::Script::Bundle
end
