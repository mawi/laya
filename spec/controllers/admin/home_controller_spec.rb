require 'spec_helper'

describe Admin::HomeController do

  it "redirects to user_path when admin" do
    user = FactoryGirl.create(:admin)
    sign_in(user)
    get "index"
    response.should redirect_to(admin_users_path)
  end

  it "redirects to client_path when user" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    get "index"
    response.should redirect_to(admin_clients_path)
  end

  it "can't login when not aproved" do
    user = FactoryGirl.create(:guest)
    sign_in(user)
    get "index"
    response.should redirect_to(new_user_session_path)
  end

end
