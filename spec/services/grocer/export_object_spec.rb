require 'spec_helper'

RSpec.describe Grocer::ExportObject do
  let(:obj) { double('object', id: 'obj1', identifier: 'ark:/12345/x12345678x') }
  let(:job) { class_double(Grocer::ExportJob).as_stubbed_const }

  before do
    allow(job).to receive(:perform_later)
  end

  it 'triggers an export job' do
    described_class.call(target: obj)
    expect(job).to have_received(:perform_later).with('obj1', 'ark:/12345/x12345678x')
  end
end
