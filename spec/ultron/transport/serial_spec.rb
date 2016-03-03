require 'spec_helper'

RSpec.describe Ultron::Transport::Serial do
  let(:port) { '/dev/cu.usbmodem1421' }
  let(:rate) { 576_000 }
  let(:instance) { described_class.new(port, rate) }
  let(:posix_termios) { double(RubySerial::Posix::Termios) }

  describe '#connect' do
    subject { instance.connect }

    before do
      expect(::Serial).to receive(:new).with(port, rate).and_return(posix_termios)
      subject
    end

    it { is_expected.to eq posix_termios }
    it { expect(instance.connection).to eq posix_termios }
  end

  describe '#get' do
    let(:message) { '{"topic":"receiver/temperature","value":"30"}' }

    subject { instance.get }

    before do
      expect(::Serial).to receive(:new).with(port, rate).and_return(posix_termios)
      instance.connect
      expect(posix_termios).to receive(:gets).and_return(message)
    end

    it { is_expected.to eq message }
  end

  describe '#write' do
    let(:message) do
      {
        topic: 'sender/infrared',
        value: 'HHHX60'
      }.to_json
    end

    subject { instance.write(message) }

    before do
      expect(::Serial).to receive(:new).with(port, rate).and_return(posix_termios)
      instance.connect
      expect(posix_termios).to receive(:write).with(message).and_return(44)
    end

    it { is_expected.to eq 44 }
  end
end
