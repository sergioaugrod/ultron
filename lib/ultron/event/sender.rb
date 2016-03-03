require 'concurrent'
require 'json'

module Ultron
  module Event
    class Sender
      include Concurrent::Async

      def initialize(serial, mqtt = nil)
        super()
        @serial = serial
        @mqtt = mqtt
      end

      def execute
        if @mqtt
          subscribe_queues
        else
          Logger.warn('Sender is offline because MQTT isnt connected')
        end
      end

      private

      def subscribe_queues
        @mqtt.subscribe('sender/#')
        Logger.info("Subscribe sender queues\n")

        @mqtt.get do |topic, value|
          message = {topic: topic, value: value}.to_json

          Logger.info("Write #{message} to serial\n")
          @serial.write(message)
        end
      end
    end
  end
end
