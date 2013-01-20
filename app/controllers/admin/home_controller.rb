class Admin::HomeController < AdminController

  def index
    if current_user.is_admin?
      redirect_to admin_users_path
    else
      redirect_to admin_clients_path
    end
  end
end
