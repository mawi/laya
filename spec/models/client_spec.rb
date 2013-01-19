require 'spec_helper'

describe Client do
  it "belongs to user and project" do
    @client = Client.create
    @client.should_not be_valid


    @client = FactoryGirl.create(:client_full)
    @client.should be_valid
  end


  it "must have an api key" do
     @client = FactoryGirl.create(:client_full)
     @client.api_key.should_not be_nil
  end

  it "must have unique api keys" do
    @client = FactoryGirl.create(:client_full)
    @client2 = FactoryGirl.create(:client_full)

    @client2.api_key = @client.api_key
    @client2.save

    @client2.should_not be_valid
  end

end
