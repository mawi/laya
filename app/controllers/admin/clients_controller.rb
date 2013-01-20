class Admin::ClientsController < AdminController
  inherit_resources

  def create
    params[:client][:user_id] = current_user.id if !current_user.is_admin
    create!
  end

  protected
    def collection
      if !current_user.is_admin
        @clients ||= end_of_association_chain.where(:user_id => current_user.id)
      else
        @clients ||= end_of_association_chain.all

      end
    end

end
