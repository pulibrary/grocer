require 'spec_helper'

RSpec.describe Grocer::ExportsController, type: :controller do
  routes { Grocer::Engine.routes }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Grocer::ExportsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all exports as @exports' do
      export = Grocer::Export.create! pid: 'pid1'
      get :index, params: {}, session: valid_session
      expect(assigns(:exports)).to eq([export])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested export as @export' do
      export = Grocer::Export.create! pid: 'pid2'
      get :show, params: { id: export.to_param }, session: valid_session
      expect(assigns(:export)).to eq(export)
    end
  end

  describe 'GET #new' do
    it 'assigns a new export as @export' do
      get :new, params: {}, session: valid_session
      expect(assigns(:export)).to be_a_new(Grocer::Export)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Grocer::Export' do
        allow(Grocer::ExportJob).to receive(:perform_later).with('pid4', 'ark4')
        expect do
          post :create, params: { export: { pid: 'pid4', ark: 'ark4' } }, session: valid_session
        end.to change(Grocer::Export, :count).by(1)
      end

      it 'assigns a newly created export as @export' do
        allow(Grocer::ExportJob).to receive(:perform_later)
        post :create, params: { export: { pid: 'pid5' } }, session: valid_session
        expect(assigns(:export)).to be_a(Grocer::Export)
        expect(assigns(:export)).to be_persisted
      end

      it 'redirects to the created export' do
        allow(Grocer::ExportJob).to receive(:perform_later)
        post :create, params: { export: { pid: 'pid6' } }, session: valid_session
        expect(response).to redirect_to(Grocer::Export.last)
      end
    end

    context 'with invalid params' do
      it "re-renders the 'new' template" do
        post :create, params: { export: { status: 'invalid' } }, session: valid_session
        expect(response).to render_template('new')
      end
    end
  end
end
