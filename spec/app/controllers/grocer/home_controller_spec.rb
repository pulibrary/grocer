require 'spec_helper'

describe Grocer::HomeController do
  describe '#index' do
    subject { described_class.new.index }
    it { is_expected.to be_nil }
  end
end
