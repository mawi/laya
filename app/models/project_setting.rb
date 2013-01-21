class ProjectSetting < ActiveRecord::Base
  belongs_to :project
  belongs_to :plugin
  belongs_to :setting
  attr_accessible :name, :value, :project_id, :plugin_id, :setting_id

  def name
    self.setting.name
  end
end
