
require "bixby-client/model/base"

Dir.glob(File.expand_path("../model/*.rb", __FILE__)).each do |f|
  require f
end
