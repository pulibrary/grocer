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

  context '' do
    subject(:export) { described_class.new pid: 'obj1' }

    describe '#running!' do
      it 'sets the pid and status' do
        export.running!(1234)
        expect(export.job).to eq(1234)
        expect(export.status).to eq('running')
      end
    end

    describe '#success!' do
      it 'sets the status and last_success' do
        export.success!
        expect(export.job).to be nil
        expect(export.last_success).not_to be nil
        expect(export.status).to eq('success')
      end
    end

    describe '#error!' do
      it 'sets the pid and status' do
        export.error!('/tmp/export.log')
        expect(export.job).to be nil
        expect(export.last_error).not_to be nil
        expect(export.logfile).not_to be nil
        expect(export.status).to eq('error')
      end
    end
  end
end
