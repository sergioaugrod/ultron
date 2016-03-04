require 'spec_helper'

RSpec.describe Ultron::Client do
  let(:serial) { double(RubySerial::Posix::Termios) }
  let(:mqtt) { MQTT::Client.new(host: 'localhost', port: 1883) }

  let(:config) do
    {
      serial: {
        port: '/dev/cu.usbmodem1421',
        rate: 9600
      },
      mqtt: {
        host: 'localhost',
        username: '',
        password: '',
        port: 1883,
        ssl: false
      }
    }
  end
  let(:instance) { described_class.new(config) }

  describe '#initialize' do
    subject { instance }

    its(:serial) { is_expected.to eq config[:serial] }
    its(:mqtt) { is_expected.to eq config[:mqtt] }
  end

  describe '#execute' do
    let(:serial_instance) { Ultron::Transport::Serial.new(config[:serial][:port], config[:serial][:rate]) }
    let(:mqtt_instance) { Ultron::Transport::MQTT.new(config[:mqtt]) }

    subject { instance.execute }

    before do
      expect(Ultron::Transport::Serial).to receive(:new).with(config[:serial][:port], config[:serial][:rate]).and_return(serial_instance)
      expect(Ultron::Transport::MQTT).to receive(:new).with(config[:mqtt]).and_return(mqtt_instance)

      expect(serial_instance).to receive(:connect).and_return(true)
    end

    context 'when mqtt connect' do
      before do
        expect(mqtt_instance).to receive(:connect).and_return(true)
      end
    end

    context 'when mqtt doesnt connect' do
      before do
        expect(mqtt_instance).to receive(:connect).raise_error(Errno::ECONNREFUSED)
        expect(Ultron.logger).to receive(:error).and_return(true)
      end
    end

    it { is_expected.to be_instance_of(Concurrent::IVar) }
  end
end
