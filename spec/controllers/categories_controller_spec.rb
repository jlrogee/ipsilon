require 'rails_helper'

RSpec.describe CategoriesController, :type => :controller do
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
    subject { FactoryGirl.create(:category)}

    before do
      sign_in user
    end

    describe "Get #index" do
      it "render index view" do
        get :index
        expect(response).to render_template :index
      end

    end

    describe "Get #show" do
      it "assigns the requested category to subject" do
        get :show, id: subject
        expect(assigns(:category)).to eq(subject)
      end

      it "renders the :show view" do
        get :show, id: subject
        expect(response).to render_template :show
      end
    end

    describe "Get #new" do
      it "assigns the requested category to new" do
        get :new
        expect(assigns(:category)).to be_new_record
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
            post :create, category: FactoryGirl.attributes_for(:category)
          }.to change(Category, :count).by(1)
        end

        it "redirects to index path" do
          post :create, category: FactoryGirl.attributes_for(:category)
          expect(response).to redirect_to categories_path
        end
      end
    end

    describe "Get #edit" do
      it "assigns the requested category to subject" do
        get :edit, id: subject
        expect(assigns(:category)).to eq(subject)
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
            patch :update, id: subject, category: {description:'new description'}
          }.to change{subject.reload.description}.to('new description')
        end

        it "redirects to index path" do
          patch :update, id: subject, category: {description:'new description'}
          expect(response).to redirect_to categories_path
        end
      end
    end

    describe "DELETE #destroy" do
      before (:each) {@category = FactoryGirl.create(:category)}
      it "deletes the category" do
        expect{
          patch :destroy, id: @category
        }.to change(Category, :count).by(-1)
      end

      it "redirects to categories#index" do
        patch :destroy, id: @category
        expect(response).to redirect_to categories_path
      end
    end

  end
end
