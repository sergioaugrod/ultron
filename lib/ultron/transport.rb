module Ultron
  module Transport
    autoload :Serial, 'ultron/transport/serial'
    autoload :MQTT, 'ultron/transport/mqtt'
  end
end
