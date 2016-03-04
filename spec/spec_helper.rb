$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'ultron'
require 'rspec/its'
require 'json'
require 'rubyserial'
require 'mqtt'
require 'codeclimate-test-reporter'

CodeClimate::TestReporter.start
