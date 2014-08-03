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

  end
end
