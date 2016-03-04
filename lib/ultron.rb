require 'ultron/version'
require 'ultron/configurable'
require 'logger'
require 'pry'

module Ultron
  class << self
    include Ultron::Configurable

    attr_accessor :logger
  end

  Ultron.logger = Logger.new(STDOUT)

  autoload :Logger, 'ultron/logger'
  autoload :Transport, 'ultron/transport'
  autoload :Event, 'ultron/event'
  autoload :Client, 'ultron/client'
end
