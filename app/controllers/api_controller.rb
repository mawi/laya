class ApiController < ApplicationController

  before_filter :restrict_access
  respond_to :json

  def call
    render :json => {:response_code => "200", :data => "API"}
  end


  private
  def restrict_access
    @client = Client.find_by_api_key(params[:api_key])
    head :unauthorized unless @client
  end

end
