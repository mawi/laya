class Admin::PluginsController < AdminController
  inherit_resources
  actions :index, :show
end
