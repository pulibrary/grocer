require 'spec_helper'

RSpec.describe Grocer, type: :model do
  context 'with a prefix' do
    it 'has a table prefix' do
      expect(described_class.table_name_prefix).to eq('grocer_')
    end
  end
end
