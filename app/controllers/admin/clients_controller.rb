class Admin::ClientsController < AdminController
  inherit_resources

  def create
    params[:client][:user_id] = current_user.id if !current_user.is_admin
    create!
  end

end
