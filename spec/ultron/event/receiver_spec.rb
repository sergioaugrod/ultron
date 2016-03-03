require 'spec_helper'

RSpec.describe Ultron::Event::Receiver do
  let(:serial) { double(RubySerial::Posix::Termios) }
  let(:mqtt) { MQTT::Client.new(host: 'localhost', port: 1883) }
  let(:instance) { described_class.new(serial, mqtt) }

  describe '#execute' do
    subject { subject.execute }

    before do
      expect(instance).to receive(:loop).and_yield
      expect(instance).to receive(:parse_and_publish)
    end

    it { is_expected.to eq true }
  end
end
