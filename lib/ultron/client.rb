module Ultron
  class Client
    attr_reader :sender, :receiver

    def initialize(config = {})
      @config = config
    end

    def execute
      serial = serial_connect
      mqtt = mqtt_connect

      Ultron::Sender.new(serial, mqtt).async.execute
      Ultron::Receiver.new(serial, mqtt).async.execute
    end

    def serial_connect
      Ultron::Serial.new(@config[:serial][:port], @config[:serial][:rate]).tap do |serial|
        serial.connect
      end
    end

    def mqtt_connect
      Ultron::MQTT.new(@config[:mqtt]).connect
    rescue
      Logger.error('Failed MQTT connection') && false
    end
  end
end
