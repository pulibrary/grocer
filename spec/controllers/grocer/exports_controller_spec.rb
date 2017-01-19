require 'spec_helper'

RSpec.describe Grocer::ExportsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Grocer::Export. As you add validations to Grocer::Export, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { pid: 'p123456789x' } }

  let(:invalid_attributes) { {} }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Grocer::ExportsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all grocer_exports as @grocer_exports' do
      export = Grocer::Export.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:grocer_exports)).to eq([export])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested grocer_export as @grocer_export' do
      export = Grocer::Export.create! valid_attributes
      get :show, params: { id: export.to_param }, session: valid_session
      expect(assigns(:grocer_export)).to eq(export)
    end
  end

  describe 'GET #new' do
    it 'assigns a new grocer_export as @grocer_export' do
      get :new, params: {}, session: valid_session
      expect(assigns(:grocer_export)).to be_a_new(Grocer::Export)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested grocer_export as @grocer_export' do
      export = Grocer::Export.create! valid_attributes
      get :edit, params: { id: export.to_param }, session: valid_session
      expect(assigns(:grocer_export)).to eq(export)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Grocer::Export' do
        expect do
          post :create, params: { grocer_export: valid_attributes }, session: valid_session
        end.to change(Grocer::Export, :count).by(1)
      end

      it 'assigns a newly created grocer_export as @grocer_export' do
        post :create, params: { grocer_export: valid_attributes }, session: valid_session
        expect(assigns(:grocer_export)).to be_a(Grocer::Export)
        expect(assigns(:grocer_export)).to be_persisted
      end

      it 'redirects to the created grocer_export' do
        post :create, params: { grocer_export: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Grocer::Export.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved grocer_export as @grocer_export' do
        post :create, params: { grocer_export: invalid_attributes }, session: valid_session
        expect(assigns(:grocer_export)).to be_a_new(Grocer::Export)
      end

      it "re-renders the 'new' template" do
        post :create, params: { grocer_export: invalid_attributes }, session: valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested grocer_export' do
        export = Grocer::Export.create! valid_attributes
        put :update, params: { id: export.to_param, grocer_export: new_attributes },
                     session: valid_session
        export.reload
        skip('Add assertions for updated state')
      end

      it 'assigns the requested grocer_export as @grocer_export' do
        export = Grocer::Export.create! valid_attributes
        put :update, params: { id: export.to_param, grocer_export: valid_attributes },
                     session: valid_session
        expect(assigns(:grocer_export)).to eq(export)
      end

      it 'redirects to the grocer_export' do
        export = Grocer::Export.create! valid_attributes
        put :update, params: { id: export.to_param, grocer_export: valid_attributes },
                     session: valid_session
        expect(response).to redirect_to(export)
      end
    end

    context 'with invalid params' do
      it 'assigns the grocer_export as @grocer_export' do
        export = Grocer::Export.create! valid_attributes
        put :update, params: { id: export.to_param, grocer_export: invalid_attributes },
                     session: valid_session
        expect(assigns(:grocer_export)).to eq(export)
      end

      it "re-renders the 'edit' template" do
        export = Grocer::Export.create! valid_attributes
        put :update, params: { id: export.to_param, grocer_export: invalid_attributes },
                     session: valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested grocer_export' do
      export = Grocer::Export.create! valid_attributes
      expect do
        delete :destroy, params: { id: export.to_param }, session: valid_session
      end.to change(Grocer::Export, :count).by(-1)
    end

    it 'redirects to the grocer_exports list' do
      export = Grocer::Export.create! valid_attributes
      delete :destroy, params: { id: export.to_param }, session: valid_session
      expect(response).to redirect_to(grocer_exports_url)
    end
  end
end
