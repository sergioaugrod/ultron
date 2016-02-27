module Ultron
  class Sender
    include Concurrent::Async

    def initialize(serial, mqtt = nil)
      super()
      @serial = serial
      @mqtt = mqtt
    end

    def execute
      #@serial.write(message)
    end
  end
end
