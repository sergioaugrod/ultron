require 'concurrent'
require 'json'

module Ultron
  module Event
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
          sleep(1)
        end
      end

      def parse_and_publish(message)
        data = JSON.parse(message)
        Ultron.logger.info("Parsed serial object: #{data}")

        publish(data['topic'], data['value']) if @mqtt
      rescue
        Ultron.logger.error("Failed to parse serial object: #{message}")
      end

      private

      def publish(topic, value)
        @mqtt.publish("receiver/#{topic}", value)
        Ultron.logger.info("Publish #{value} to sensors/#{topic}\n")
      end
    end
  end
end
