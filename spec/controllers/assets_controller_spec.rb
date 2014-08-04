require 'rails_helper'

RSpec.describe AssetsController, :type => :controller do
  context "when user not logged in" do
    describe "Get #index" do
      it " redirect to login page" do
        get :index
        expect(response).to redirect_to new_user_session_path
      end

    end
  end

  context "when user logged in" do
    let(:user) { FactoryGirl.create(:user)}
    subject { FactoryGirl.create(:asset)}

    before do
      sign_in user
    end

    describe "GET #index" do
      it "render :index view" do
        get :index
        expect(response).to render_template :index
      end

      it "assigns the request asset to name" do
        get :index
        expect(assigns(:assets)).to eq([subject])
      end
    end

    describe "GET #show" do
      it "assigns the requested asset to subject" do
        get :show, id: subject
        expect(assigns(:asset)).to eq(subject)
      end

      it "render the show view" do
        get :show, id: subject
        expect(response).to render_template :show
      end
    end

    describe "GET #new" do
      it "assigns the requested asset to new asset" do
        get :new
        expect(assigns(:asset)).to be_new_record
      end

      it "render the :new view" do
        get :new
        expect(response).to render_template :new
      end
    end

    describe "POST #create" do
      context "with valid attributes" do
        it "create new asset" do
          expect{post :create, asset: FactoryGirl.attributes_for(:asset)}.to change(Asset, :count) by(1)
        end

      it "rendirect to index path" do
        post :create, asset: FactoryGirl.attributes_for(:project)
        expect(response).to redirect_to assets_path
      end
    end

    describe "GET #edit	" do
      it "assigns the requested asset to subject" do
        get :edit, id: subject
        expect(assigns(:asset)).to eq(subject)
      end

      it "renders the :edit view" do
        get :edit, id: subject
        expect(response).to render_template :edit
      end
    end

    describe "PATCH #update" do
      context "with valid attributes" do
        it "updates object" do
          expect{patch :update, id: subject, asset: { name: 'new_asset' }.to change( subject.reload.name).to('new_asset')
        end

      it "rendirect to index path" do
        patch :update, id: subject, asset: { name: 'new_asset' }
        expect(response).to redirect_to assets_path
      end
    end


    describe "DELETE #destroy" do
      before(:each) { FactoryGirl.create :asset, owner: user }

      it "deletes the asset" do
        expect{ delete :destroy, id: @asset}.to change(Asset, :count).by(-1)
      end

      it "rendirect to assets#index" do
        delete :destroy, id: asset
        expect(response).to redirect_to assets_path
      end
    end

  end

end
