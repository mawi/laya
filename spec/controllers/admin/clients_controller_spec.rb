require 'spec_helper'

describe Admin::ClientsController do

  it "admin can create clients with users" do
    @admin = FactoryGirl.create(:admin)
    sign_in(@admin)
    post 'create', :client => { :name => 'Client', :project_id => "9999", :user_id => "999" }
    @client = assigns[:client]
    @client.user_id.should_not eq(@admin.id)
  end

  it "user can't create other users's clients" do
    @user = FactoryGirl.create(:user)
    sign_in(@user)
    post 'create', :client => { :name => 'Client', :project_id => "9999", :user_id => "999" }
    @client = assigns[:client]
    @client.user_id.should eq(@user.id)
  end

end
