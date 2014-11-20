source "https://rubygems.org"

gem 'bixby-common'
# gem 'bixby-common', :path => '../common'
# gem "bixby-auth", :path => "../auth"

gem 'multi_json'
gem 'oj'
gem 'httpi'
gem 'curb'
gem 'mixlib-shellout'
gem 'fuzzy_file_finder'

group :development do

  gem "yard"
  gem "redcarpet", :platforms => [:mri, :rbx]

  gem "bundler"
  gem "jeweler", :github => "chetan/jeweler", :branch => "bixby"
  gem "pry"
  gem "debugger",     :platforms => [:mri_19, :mri_20]
  gem "debugger-pry", :require => "debugger/pry", :platforms => [:mri_19, :mri_20]

  gem "test_guard", :github => "chetan/test_guard"
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false

end

group :test do
  gem "simplecov",  :platforms => [:mri_19, :mri_20, :rbx], :github => "chetan/simplecov", :branch => "inline_nocov"
  gem "micron",     :github => "chetan/micron"
  gem "coveralls",  :require => false

  gem "webmock", :require => false
  gem "mocha",   :require => false
  gem "psych"
end
