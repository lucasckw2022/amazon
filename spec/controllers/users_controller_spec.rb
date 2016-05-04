require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
    it "sets an instance variable of User type" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end
  describe "#create" do
    context "with valid parameters" do
      def valid_user
        post :create, user:
        u = FactoryGirl.attributes_for(:user)
      end
      it "created a user in the DB," do
          before = User.count
          valid_user
          after = User.count
          expect(after).to eq(before + 1)
      end
      it "redirects to home page" do
        valid_user
        expect(response).to redirect_to(root_path)
      end
      it "signs the user in" do
        valid_user
        expect(session[:user_id]).to eq(User.last.id)
      end
    end
    context "with invalid parameters" do
     def invalid_user
       post :create, user:
       u = FactoryGirl.attributes_for(:user).merge({first_name:nil})
     end
      it "renders the new template" do
        invalid_user
        expect(response).to render_template(:new)
      end
      it "doesn't create a user" do
        before = User.count
        invalid_user
        after = User.count
        expect(after).to eq(before)
      end
    end
  end
end
