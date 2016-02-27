require 'concurrent'
require 'json'

module Ultron
  class Receiver
    include Concurrent::Async

    def initialize(serial, mqtt = nil)
      super()
      @serial = serial
      @mqtt = mqtt
    end

    def execute
      loop do
        parse_and_publish(@serial.get)
        sleep 1
      end
    end

    private

    def parse_and_publish(message)
      puts message

      data = JSON.parse(message)
      puts data

      #data.each_pair do |key, value|
      #  publish(key, value)
    #  end
    rescue
      puts "Tente outra vez"
    end

    def publish(key, value)
      @mqtt.publish("sensors/#{key}", value)
    end
  end
end
