require 'spec_helper'
require "cancan/matchers"

describe User do
  describe "Creation:" do
    it "creates a valid user" do
      user = FactoryGirl.create(:admin)
      user.should be_valid
    end

    it "needs validation" do
      user = User.create
      user.should_not be_valid
    end

    it "not confirmed when created" do
      user = User.new
      user.approved.should eq(false)
    end
  end

  describe "Permissions" do
    before(:each) do
      @admin = FactoryGirl.create(:admin)
      @user = FactoryGirl.create(:user)
      @project = FactoryGirl.create(:project)
      @ability_admin = Ability.new(@admin)
      @ability_user = Ability.new(@user)
    end

    it "admin can manage all" do
      @ability_admin.should be_able_to(:manage, @user)
      @ability_admin.should be_able_to(:manage, @project)
    end

    it "user can read projects" do
      @ability_user.should be_able_to(:read, @project)
    end

    it "user can't manage users" do
      @ability_user.should_not be_able_to(:manage, @admin)
    end

  end

end