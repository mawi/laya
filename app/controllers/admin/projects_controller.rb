class Admin::ProjectsController < AdminController
  inherit_resources

  def edit_settings
    @project = Project.find(params[:id])
  end

end
