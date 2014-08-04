require 'rails_helper'

RSpec.describe DepartamentsController, :type => :controller do
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
    subject { FactoryGirl.create(:departament)}

    before do
      sign_in user
    end

    describe "Get #index" do
      it "render index view" do
        get :index
        expect(response).to render_template :index
      end

      it "assigns the request departament to depname" do
        get :index
        expect(assigns(:departaments)).to eq([subject])
      end
    end

    describe "Get #show" do
      it "assigns the requested departament to subject" do
        get :show, id: subject
        expect(assigns(:departament)).to eq(subject)
      end

      it "renders the :show view" do
        get :show, id: subject
        expect(response).to render_template :show
      end
    end

    describe "Get #new" do
      it "assigns the requested departament to new" do
        get :new
        expect(assigns(:departament)).to be_new_record
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
            post :create, departament: FactoryGirl.attributes_for(:departament)
          }.to change(Departament, :count).by(1)
        end

        it "redirects to index path" do
          post :create, departament: FactoryGirl.attributes_for(:departament)
          expect(response).to redirect_to departaments_path
        end
      end
    end

    describe "Get #edit" do
      it "assigns the requested departament to subject" do
        get :edit, id: subject
        expect(assigns(:departament)).to eq(subject)
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
            patch :update, id: subject, departament: {depname:'new departament'}
          }.to change{subject.reload.depname}.to('new departament')
        end

        it "redirects to index path" do
          patch :update, id: subject, departament: {depname:'new departament'}
          expect(response).to redirect_to departaments_path
        end
      end
    end

    describe "DELETE #destroy" do
      before (:each) {@departament = FactoryGirl.create(:departament)}
      it "deletes the departament" do
        expect{
          patch :destroy, id: @departament
        }.to change(Departament, :count).by(-1)
      end

      it "redirects to departaments#index" do
        patch :destroy, id: @departament
        expect(response).to redirect_to departaments_path
      end
    end

  end
end
