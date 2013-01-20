class ProjectSetting < ActiveRecord::Base
  belongs_to :project
  belongs_to :plugin
  attr_accessible :name, :value, :project_id, :plugin_id
end
