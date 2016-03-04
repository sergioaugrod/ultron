# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ultron/version'

Gem::Specification.new do |spec|
  spec.name          = 'ultron'
  spec.version       = Ultron::VERSION
  spec.authors       = ["Sérgio Rodrigues"]
  spec.email         = ['sergioaugrod@gmail.com']

  spec.summary       = %q{Communicates with arduino and publishes to a MQTT broker.}
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-its'
  spec.add_development_dependency 'concurrent-ruby'
  spec.add_development_dependency 'rubyserial'
  spec.add_development_dependency 'mqtt'
  spec.add_development_dependency 'awesome_print'
  spec.add_development_dependency 'codeclimate-test-reporter'
end
