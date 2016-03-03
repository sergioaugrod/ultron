require 'spec_helper'

RSpec.describe Ultron::Configurable do
  describe '.keys' do
    let(:keys) { [:serial, :mqtt] }

    subject { described_class.keys }

    it { is_expected.to eq keys }
  end
end
