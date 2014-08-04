require 'rails_helper'

RSpec.describe KnowledgeBasesController, :type => :controller do

  context "when user not logged in" do
    describe "Get #index" do
      it " redirect to login page" do
        get :index
        expect(response).to redirect_to new_user_session_path
      end

    end
  end

  context "when user logged in kb" do
    let(:user) { FactoryGirl.create(:user)}
    subject { FactoryGirl.create(:kb)}

    before do
      sign_in user
    end

    describe "Get #index" do
      it "render index view" do
        get :index
        expect(response).to render_template :kb
      end

      it "assigns the request kbname to kb" do
        get :index
        expect(assigns(:knowledge_bases)).to eq([subject])
      end
    end

    describe "Get #show" do
      it "assigns the requested knowledge_bases to subject" do
        get :show, id: subject
        expect(assigns(:knowledge_base)).to eq(subject)
      end

      it "renders the :show view" do
        get :show, id: subject
        expect(response).to render_template :show
      end
    end

    describe "Get #new" do
      it "assigns the requested knowledge_bases to new" do
        get :new
        expect(assigns(:knowledge_base)).to be_new_record
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
            post :create, knowledge_base: FactoryGirl.attributes_for(:kb)
          }.to change(KnowledgeBase, :count).by(1)
        end

        it "redirects to index path" do
          post :create, knowledge_base: FactoryGirl.attributes_for(:kb)
          expect(response).to redirect_to knowledge_bases_path + "/index/kb"
        end
      end
    end

    describe "Get #edit" do
      it "assigns the requested knowledge_bases to subject" do
        get :edit, id: subject
        expect(assigns(:knowledge_base)).to eq(subject)
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
            patch :update, id: subject, knowledge_base: {description:'new description'}
          }.to change{subject.reload.description}.to('new description')
        end

        it "redirects to index path" do
          patch :update, id: subject, knowledge_base: {description:'new description'}
          expect(response).to redirect_to knowledge_bases_path + "/index/kb"
        end
      end
    end

    describe "DELETE #destroy" do
      before (:each) {@knowledge_base = FactoryGirl.create(:kb)}
      it "deletes the knowledge_bases" do
        expect{
          patch :destroy, id: @knowledge_base
        }.to change(KnowledgeBase, :count).by(-1)
      end

      it "redirects to knowledge_bases#index" do
        patch :destroy, id: @knowledge_base
        expect(response).to redirect_to knowledge_bases_path + "/index/kb"
      end
    end

  end

end
