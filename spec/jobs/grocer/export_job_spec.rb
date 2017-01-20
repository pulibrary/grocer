require 'spec_helper'
require 'open3'
require 'active-fedora'

RSpec.describe Grocer::ExportJob do
  let(:thread) { instance_double('Process::Waiter') }
  let(:stdout) { StringIO.new("foo\nbar\nbaz\n") }
  let(:meta) { Tempfile.create 'export_job_templ' }
  let(:logfile) { Tempfile.create 'export_job_log' }
  let(:template) { fixture_file('metadata_template.yml') }
  let(:af_config) { { url: 'http://example.org/rest', base_path: '/test' } }
  let(:pid) { 1234 }

  before do
    allow(Open3).to receive(:popen2e).and_yield(nil, stdout, thread)
    allow(Tempfile).to receive(:create).and_return(meta, logfile)
    allow(thread).to receive(:pid).and_return(pid)

    allow(ActiveFedora).to receive_message_chain(:config, :credentials).and_return(af_config)
    Grocer.configure do |conf|
      conf.metadata_template = file_fixture('metadata_template.yml')
    end
  end

  context 'a successful export' do
    before do
      allow(thread).to receive_message_chain(:value, :success?).and_return(true)
    end

    it 'reports success' do
      described_class.perform_now('obj1')
      expect(Grocer::Export.find_by(pid: 'obj1').status).to eq('success')
    end
  end

  context 'an unsuccessful export' do
    before do
      allow(thread).to receive_message_chain(:value, :success?).and_return(false)
    end

    it 'reports success' do
      described_class.perform_now('obj1')
      expect(Grocer::Export.find_by(pid: 'obj1').status).to eq('error')
    end
  end
end
