class PluginProject < ActiveRecord::Base
  belongs_to :plugin
  belongs_to :project
end
