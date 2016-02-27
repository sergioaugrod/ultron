require 'mqtt'

module Ultron
  class MQTT
    attr_accessor :host, :username, :password, :port, :ssl

    def initialize(attrs)
      attrs.each_pair do |key, value|
        send("#{key}=", value)
      end
    end

    def connect
      Logger.info("Connecting to #{@host} MQTT")

      ::MQTT::Client.connect(
        host: @host,
        username: @username,
        password: @password,
        port: @port,
        ssl: @ssl
      )
    end
  end
end
