source "http://rubygems.org"

gem 'bixby-common', :git => "https://github.com/chetan/bixby-common.git"

gem "api-auth", :git => "https://github.com/chetan/api_auth.git", :branch => "non_rails"

gem 'multi_json'
gem 'oj'
gem 'httpi',        :git => "https://github.com/chetan/httpi.git",
                    :branch => "chunked_responses"
gem 'curb'

group :development do

  gem "yard"
  gem "redcarpet", :platforms => [:mri, :rbx]

  gem "bundler"
  gem "jeweler", :git => "https://github.com/chetan/jeweler.git", :branch => "bixby"
  gem "pry"
  gem "debugger",     :platforms => :mri_19
  gem "debugger-pry", :require => "debugger/pry", :platforms => :mri_19

  gem "simplecov",    :platforms => [:mri_19, :rbx], :git => "https://github.com/chetan/simplecov.git", :branch => "inline_nocov"

  gem "minitest",     :platforms => [:mri_19, :rbx]
  gem "webmock",      :require => false
  gem "mocha",        :require => false

  gem "test_guard", :git => "https://github.com/chetan/test_guard.git"
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false

end

