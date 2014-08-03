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

  end

end
