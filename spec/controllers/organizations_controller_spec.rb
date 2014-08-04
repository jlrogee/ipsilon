require 'rails_helper'

RSpec.describe OrganizationsController, :type => :controller do
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
    subject { FactoryGirl.create(:organization)}

    before do
      sign_in user
    end

    describe "Get #index" do
      it "render index view" do
        get :index
        expect(response).to render_template :index
      end

      it "assigns the request organization to name" do
        get :index
        expect(assigns(:organizations)).to eq([subject])
      end
    end

    describe "Get #show" do
      it "assigns the requested organization to subject" do
        get :show, id: subject
        expect(assigns(:organization)).to eq(subject)
      end

      it "renders the :show view" do
        get :show, id: subject
        expect(response).to render_template :show
      end
    end

    describe "Get #new" do
      it "assigns the requested organization to new" do
        get :new
        expect(assigns(:organization)).to be_new_record
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
            post :create, organization: FactoryGirl.attributes_for(:organization)
          }.to change(Organization, :count).by(1)
        end

        it "redirects to index path" do
          post :create, organization: FactoryGirl.attributes_for(:organization)
          expect(response).to redirect_to organizations_path
        end
      end
    end

    describe "Get #edit" do
      it "assigns the requested organization to subject" do
        get :edit, id: subject
        expect(assigns(:organization)).to eq(subject)
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
            patch :update, id: subject, organization: {orgname:'new orgname'}
          }.to change{subject.reload.orgname}.to('new orgname')
        end

        it "redirects to index path" do
          patch :update, id: subject, organization: {orgname:'new orgname'}
          expect(response).to redirect_to organizations_path
        end
      end
    end

    describe "DELETE #destroy" do
      before (:each) {@organization = FactoryGirl.create(:organization)}
      it "deletes the organization" do
        expect{
          patch :destroy, id: @organization
        }.to change(Organization, :count).by(-1)
      end

      it "redirects to organizations#index" do
        patch :destroy, id: @organization
        expect(response).to redirect_to organizations_path
      end
    end
  end
end
