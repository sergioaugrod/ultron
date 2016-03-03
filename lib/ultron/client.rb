module Ultron
  class Client
    include Configurable

    attr_reader :sender, :receiver

    def initialize(options = {})
      Ultron::Configurable.keys.each do |key|
        send("#{key}=", options[key] || Ultron.send("#{key}"))
      end
    end

    def execute
      serial = serial_connect
      mqtt = mqtt_connect

      Event::Sender.new(serial, mqtt).async.execute
      Event::Receiver.new(serial, mqtt).async.execute
    end

    private

    def serial_connect
      Transport::Serial.new(@serial[:port], @serial[:rate]).tap do |serial|
        serial.connect
      end
    end

    def mqtt_connect
      Transport::MQTT.new(@mqtt).connect
    rescue
      Logger.error('Failed MQTT connection') && false
    end
  end
end
