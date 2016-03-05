require 'spec_helper'

RSpec.describe Ultron::Event::Sender do
  let(:serial) { double(RubySerial::Posix::Termios) }
  let(:mqtt) { MQTT::Client.new(host: 'localhost', port: 1883) }
  let(:instance) { described_class.new(serial, mqtt) }

  describe '#execute' do
    subject { instance.execute }

    context 'when has mqtt' do
      let(:topic) { 'sensors/temperature' }
      let(:value) { 10 }
      let(:message) { { topic: topic, value: value }.to_json }

      before do
        expect(mqtt).to receive(:subscribe).with('sender/#').and_return(true)
        expect(mqtt).to receive(:get).and_yield(topic, value)

        expect(serial).to receive(:write).with(message).and_return(true)
      end

      it { is_expected.to be_truthy }
    end

    context 'when hasnt mqtt' do
      let(:mqtt) { nil }

      before do
        expect(Ultron.logger).to receive(:warn).and_return(true)
      end

      it { is_expected.to be_truthy }
    end
  end
end
