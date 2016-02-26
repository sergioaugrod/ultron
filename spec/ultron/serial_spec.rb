require 'spec_helper'

RSpec.describe Ultron::Serial do
  let(:port) { '/dev/cu.usbmodem1421' }
  let(:rate) { 576000 }
  let(:instance) { described_class.new(port, rate) }

  describe '#connect' do
    let(:posix_termios) { double(RubySerial::Posix::Termios) }
    subject { instance.connect }

    before do
      expect(::Serial).to receive(:new).with(port, rate).and_return(posix_termios)
      subject
    end

    it { is_expected.to eq posix_termios }
    it { expect(instance.connection).to eq posix_termios }
  end
end
