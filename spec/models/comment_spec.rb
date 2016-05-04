require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "validate star" do
    it "not less than 1" do
      u = Comment.new FactoryGirl.attributes_for(:comment).merge({star:0})
      expect(u).to be_invalid
    end
    it "not greater than 5" do
      u = Comment.new FactoryGirl.attributes_for(:comment).merge({star:10})
      expect(u).to be_invalid
    end
  end
end
