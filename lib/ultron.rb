require 'ultron/version'
require 'ultron/configurable'
require 'pry'

module Ultron
  class << self
    include Ultron::Configurable
  end

  autoload :Logger, 'ultron/logger'
  autoload :Transport, 'ultron/transport'
  autoload :Event, 'ultron/event'
  autoload :Client, 'ultron/client'
end
