class ApplicationController < ActionController::Base
  protect_from_forgery


  # rescue_from CanCan::AccessDenied do |exception|
  #   redirect_to admin_dashboard_path, :alert => exception.message
  # end


  # Devise method to redirect user after login.
  def after_sign_in_path_for(resource)
    if resource.is_admin?
      admin_users_path
    else
      admin_clients_path
    end
  end

  # Devise method to redirect user after logout.
  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end

end
