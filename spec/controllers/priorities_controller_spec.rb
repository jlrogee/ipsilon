require 'rails_helper'

RSpec.describe PrioritiesController, :type => :controller do
  
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
    subject { FactoryGirl.create(:priority)}

    before do
      sign_in user
    end

    describe "Get #index" do
      it "render index view" do
        get :index
        expect(response).to render_template :index
      end

      it "assigns the request priority to prname" do
        get :index
        expect(assigns(:priorities)).to eq([subject])
      end
    end

    describe "Get #new" do
      it "assigns the requested priority to new" do
        get :new
        expect(assigns(:priority)).to be_new_record
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
            post :create, priority: FactoryGirl.attributes_for(:priority)
          }.to change(Priority, :count).by(1)
        end

        it "redirects to index path" do
          post :create, priority: FactoryGirl.attributes_for(:priority)
          expect(response).to redirect_to priorities_path
        end
      end
    end

    describe "Get #edit" do
      it "assigns the requested priority to subject" do
        get :edit, id: subject
        expect(assigns(:priority)).to eq(subject)
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
            patch :update, id: subject, priority: {days_to_close: 8 }
          }.to change{subject.reload.days_to_close}.to(8)
        end

        it "redirects to index path" do
          patch :update, id: subject, priority: {days_to_close: 8 }
          expect(response).to redirect_to priorities_path
        end
      end
    end

    describe "DELETE #destroy" do
      before (:each) {@priority = FactoryGirl.create(:priority)}
      it "deletes the priority" do
        expect{
          patch :destroy, id: @priority
        }.to change(Priority, :count).by(-1)
      end

      it "redirects to priorities#index" do
        patch :destroy, id: @priority
        expect(response).to redirect_to priorities_path
      end
    end
    
  end
end
