require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development, :test)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require "awesome_print"
require "micron"
require "micron/minitest"

# Load any HTTP clients before webmock so they can be stubbed
# require 'curb'
require 'webmock'
include WebMock::API
require 'mocha/setup'

$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))
$LOAD_PATH.unshift(File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib')))
ENV["RUBYLIB"] = $:.first

require "bixby-client"
require "base"

EasyCov.path = "coverage"
EasyCov.filters << EasyCov::IGNORE_GEMS << EasyCov::IGNORE_STDLIB << EasyCov::IGNORE_TESTS

EasyCov.start
