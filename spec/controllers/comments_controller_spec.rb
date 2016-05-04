require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "create reivew" do
    let(:user) {FactoryGirl.create(:user)}
    let(:product){FactoryGirl.create(:product)}
    it "must be signed in to create a review otherwise will be redirected to the sign in page" do
      post :create, product_id: product.id, comment: {body:"hello",star:"2"}
      # session[:user_id] = nil
      expect(response).to redirect_to(new_session_path)
    end
    it  "with user signed in" do
      request.session[:user_id] = user.id
      post :create, product_id: product.id, comment: {body:"hello",star:"2"}
      expect(response).to redirect_to(product_path(product))
    end
    it "associates the review with the signed in user" do
      request.session[:user_id] = user.id
      post :create, product_id: product.id, comment: {body:"hello",star:"2"}
      expect(Comment.last.user.id).to eq(user.id)
    end
  end
end
