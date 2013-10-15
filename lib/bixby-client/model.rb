
require "bixby-client/model/base"

puts File.expand_path("../model/*.rb", __FILE__)
Dir.glob(File.expand_path("../model/*.rb", __FILE__)).each do |f|
  require f
end
