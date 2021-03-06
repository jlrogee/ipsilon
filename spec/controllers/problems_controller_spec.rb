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
            post :create, problem: (FactoryGirl.build :problem).attributes.symbolize_keys#FactoryGirl.attributes_for(:problem)
          }.to change(Problem, :count).by(1)
        end

        it "redirects to index path" do
          post :create, problem: (FactoryGirl.build :problem).attributes.symbolize_keys#FactoryGirl.attributes_for(:problem)
          expect(response).to redirect_to problems_path
        end
      end
    end

    describe "Get #edit" do
      it "assigns the requested organization to subject" do
        get :edit, id: subject
        expect(assigns(:problem)).to eq(subject)
      end

      it "renders the :edit view" do
        get :edit, id: subject
        expect(response).to render_template :edit
      end
    end

  end
end
