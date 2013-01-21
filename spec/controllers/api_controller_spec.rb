require 'spec_helper'

describe ApiController do

  it "must have api_key" do
    get :call
    response.should_not be_ok
  end

  it "access with api key" do
    @client = FactoryGirl.create(:client_full)
    key = @client.api_key

    get :call, :api_key => key
    response.should be_ok
  end

end
