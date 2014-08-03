require 'rails_helper'

RSpec.describe ProblemsController, :type => :controller do
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
    subject { FactoryGirl.create(:problem, create_user:user)}

    before do
      sign_in user
    end

    describe "Get #index" do
      it "render index view" do
        get :index
        expect(response).to render_template :index
      end

      it "assigns the requested problem to subject" do
        get :index
        expect(assigns(:problems)).to eq([subject])
      end
    end

    describe "Get #show" do
      it "assigns the requested problem to subject" do
        get :show, id: subject
        expect(assigns(:problem)).to eq(subject)
      end

      it "renders the :show view" do
        get :show, id: subject
        expect(response).to render_template :show
      end
    end

    describe "Get #new" do
      it "assigns the requested problem to new" do
        get :new
        expect(assigns(:problem)).to be_new_record
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
            post :create, problem: FactoryGirl.attributes_for(:problem)
          }.to change(Problem, :count).by(1)
        end

        it "redirects to index path" do
          post :create, problem: FactoryGirl.attributes_for(:problem)
          expect(response).to redirect_to problems_path
        end
      end
    end

    describe "Get #edit" do
      it "assigns the requested problem to subject" do
        get :edit, id: subject
        expect(assigns(:problem)).to eq(subject)
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
            patch :update, id: subject, problem: {description:'new description'}
          }.to change{subject.reload.description}.to('new description')
        end

        it "redirects to index path" do
          patch :update, id: subject, problem: {description:'new description'}
          expect(response).to redirect_to problems_path
        end
      end
    end

    describe "DELETE #destroy" do
      before (:each) {@problem = FactoryGirl.create(:problem, create_user:user)}
      it "deletes the problem" do
          expect{
            patch :destroy, id: @problem
          }.to change(Problem, :count).by(-1)
      end

      it "redirects to problems#index" do
          patch :destroy, id: @problem
          expect(response).to redirect_to problems_path
      end
    end
  end
end