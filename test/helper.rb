require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development, :test)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'test_guard'
TestGuard.load_simplecov()

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

MiniTest::Unit.autorun
