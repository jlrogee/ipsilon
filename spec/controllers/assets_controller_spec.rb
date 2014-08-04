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

    describe "Get #index" do
      it "render index view" do
        get :index
        expect(response).to render_template :index
      end

      it "assigns the request asset to prname" do
        get :index
        expect(assigns(:assets)).to eq([subject])
      end
    end

    describe "Get #new" do
      it "assigns the requested asset to new" do
        get :new
        expect(assigns(:asset)).to be_new_record
      end

      it "renders the :new view" do
        get :new
        expect(response).to render_template :new
      end
    end

    describe "POST #create" do
      context "with valid attributes" do
        it "creates new object" do
          expect{
            post :create, asset: FactoryGirl.attributes_for(:asset)
          }.to change(Asset, :count).by(1)
        end

        it "redirects to index path" do
          post :create, asset: FactoryGirl.attributes_for(:asset)
          expect(response).to redirect_to assets_path
        end
      end
    end

    describe "Get #edit" do
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
          expect{
            patch :update, id: subject, asset: { name: 'new name' }
          }.to change{subject.reload.name}.to('new name')
        end

        it "redirects to index path" do
          patch :update, id: subject, asset: { name: 'new name' }
          expect(response).to redirect_to assets_path
        end
      end
    end

    describe "DELETE #destroy" do
      before (:each) {@asset = FactoryGirl.create(:asset)}
      it "deletes the asset" do
        expect{
          patch :destroy, id: @asset
        }.to change(Asset, :count).by(-1)
      end

      it "redirects to assets#index" do
        patch :destroy, id: @asset
        expect(response).to redirect_to assets_path
      end
    end

  end
  
end
