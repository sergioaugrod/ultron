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

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'pry', '~> 0.10.3'
  spec.add_development_dependency 'rspec', '~> 3.4'
  spec.add_development_dependency 'rspec-its', '~> 1.2'
  spec.add_development_dependency 'concurrent-ruby', '~> 1.0.1'
  spec.add_development_dependency 'rubyserial', '~> 0.2.4'
  spec.add_development_dependency 'mqtt', '~> 0.3.1'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 0.5'
end
