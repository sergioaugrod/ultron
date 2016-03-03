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
    subject { instance.execute }

    before do
      expect(instance).to receive(:serial_connect).and_return(true)
      expect(instance).to receive(:mqtt_connect).and_return(true)
    end

    it { is_expected.to be_instance_of(Concurrent::IVar) }
  end
end
