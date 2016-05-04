require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#new" do
    it "First name must be present" do
      u = User.new FactoryGirl.attributes_for(:user).merge({first_name:nil})
      expect(u).to be_invalid
    end
    it "Last name must be present" do
      u = User.new FactoryGirl.attributes_for(:user).merge({last_name:nil})
      expect(u).to be_invalid
    end
    it "Email must be unique" do
      u = FactoryGirl.create(:user)
      u2 = User.new FactoryGirl.attributes_for(:user).merge({email:u.email})
      expect(u2).to be_invalid
    end
    it "full_name method must return titleized first_name and last_name concatenated" do
      u = User.new FactoryGirl.attributes_for(:user).merge({first_name:"Paddy", last_name:"Teddy"})
      expect(u.full_name).to eq("Paddy Teddy")
    end
  end
end
