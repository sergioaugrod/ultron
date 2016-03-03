require 'spec_helper'

RSpec.describe Ultron::Logger do
  let(:message) { 'any message' }

  describe '#debug' do
    context 'when has message' do
      subject { described_class.debug(message) }

      it { is_expected.to be_truthy }
    end

    context 'when hasnt message' do
      subject { described_class.debug }

      it { expect{subject}.to raise_error(ArgumentError) }
    end
  end

  describe '#info' do
    context 'when has message' do
      subject { described_class.info(message) }

      it { is_expected.to be_truthy }
    end

    context 'when hasnt message' do
      subject { described_class.info }

      it { expect{subject}.to raise_error(ArgumentError) }
    end
  end

  describe '#warn' do
    context 'when has message' do
      subject { described_class.warn(message) }

      it { is_expected.to be_truthy }
    end

    context 'when hasnt message' do
      subject { described_class.warn }

      it { expect{subject}.to raise_error(ArgumentError) }
    end
  end

  describe '#error' do
    context 'when has message' do
      subject { described_class.error(message) }

      it { is_expected.to be_truthy }
    end

    context 'when hasnt message' do
      subject { described_class.error }

      it { expect{subject}.to raise_error(ArgumentError) }
    end
  end
end
