require 'spec_helper'
describe AdminUser do
  describe "Creation:" do
    it "creates a valid user" do
      user = FactoryGirl.create(:admin)
      user.should be_valid
    end

    it "needs validation" do
      user = AdminUser.create
      user.should_not be_valid
    end

    it "not confirmed when created" do
      user = FactoryGirl.create(:user)
      user.approved.should eq(false)
    end

  end
end