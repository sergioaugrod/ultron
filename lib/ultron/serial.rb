require 'rubyserial'

module Ultron
  class Serial
    attr_reader :connection

    def initialize(port, rate = 9600)
      @port = port
      @rate = rate
    end

    def connect
      @connection = ::Serial.new(@port, @rate)
    end

    def get
      @connection.gets
    end

    def send(message)
      @connection.write(message)
    end
  end
end
