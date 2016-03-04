module Ultron
  class Client
    include Configurable

    def initialize(options = {})
      Ultron::Configurable.keys.each do |key|
        send("#{key}=", options[key] || Ultron.send(key.to_s))
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
      Transport::Serial.new(@serial[:port], @serial[:rate]).tap(&:connect)
    end

    def mqtt_connect
      Transport::MQTT.new(@mqtt).connect
    rescue
      Ultron.logger.error('Failed MQTT connection') && false
    end
  end
end
