
# for reporting to coveralls
require "coveralls"
desc "Report coverage to coveralls"
task :coveralls do
  SimpleCov.formatter = Coveralls::SimpleCov::Formatter
  if File.exists? File.join(EasyCov.path, ".resultset.json") then
    SimpleCov::ResultMerger.merged_result.format!
  end
end
