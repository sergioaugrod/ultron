require 'spec_helper'

RSpec.describe Ultron::Event::Receiver do
  let(:serial) { double(RubySerial::Posix::Termios) }
  let(:mqtt) { MQTT::Client.new(host: 'localhost', port: 1883) }
  let(:instance) { described_class.new(serial, mqtt) }

  describe '#parse_and_publish' do
    let(:message) { '{"topic":"receiver/temperature","value":"30"}' }
    let(:message_parsed) { JSON.parse(message) }
    let(:topic) { message_parsed['topic'] }
    let(:value) { message_parsed['value'] }

    subject { instance.parse_and_publish(message) }

    context 'when valid message' do
      before do
        expect(Ultron.logger).to receive(:info).and_return(true)
      end

      context 'when has mqtt' do
        before do
          expect(mqtt).to receive(:publish).with("receiver/#{topic}", value).and_return(true)
          expect(Ultron.logger).to receive(:info).and_return(true)
        end

        it { is_expected.to be_truthy }
      end

      context 'when hasnt mqtt' do
        let(:mqtt) { nil }

        it { is_expected.to be_nil }
      end
    end

    context 'when invalid message' do
      let(:message) { 'topic: receiver/temperature, value: 30' }

      before do
        expect(Ultron.logger).to receive(:error).and_return(true)
      end

      it { is_expected.to be_truthy }
    end
  end
end
