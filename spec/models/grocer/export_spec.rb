require 'spec_helper'

RSpec.describe Grocer::Export, type: :model do
  context 'requires a pid' do
    let(:invalid_export) { described_class.new }
    let(:valid_export) { described_class.new pid: 'pid1234' }

    it 'cannot create an export without a pid' do
      expect { invalid_export.save! }.to raise_error ActiveRecord::RecordInvalid
    end
    it 'can create an export with a pid' do
      expect { valid_export.save! }.not_to raise_error
    end
  end
end
