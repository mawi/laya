class Admin::UsersController < AdminController
  inherit_resources

  def update
      @user = User.find(current_user.id)
      if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
         params[:user].delete(:password)
         params[:user].delete(:password_confirmation)
      end
      if @user.update_attributes(params[:user])
        # Sign in the user by passing validation in case his password changed
        sign_in @user, :bypass => true
        redirect_to edit_admin_user_path(@user), :notice => "User updated"
      else
        render "edit"
      end
    end

end
