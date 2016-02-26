require 'rubyserial'

module Ultron
  class Serial
    attr_reader :connection

    def initialize(port, rate = 576000)
      @port = port
      @rate = rate
    end

    def connect
      @connection = ::Serial.new(@port, @rate)
    end
  end
end
