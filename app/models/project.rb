class Project < ActiveRecord::Base
  has_many :clients
  has_many :plugin_projects
  has_many :plugins, :through => :plugin_projects,
                        :after_add => :generate_project_settings,
                        :before_remove => :delete_project_settings
  has_many :project_settings

  attr_accessible :description, :name, :project_settings_attributes, :plugin_ids
  validates_presence_of :name

  accepts_nested_attributes_for :project_settings



  def generate_project_settings(obj)
    obj.settings.each do |setting|
      ProjectSetting.create(:plugin_id => obj.id, :project_id => self.id, :setting_id => setting.id)
    end
  end

  def delete_project_settings(obj)
    self.project_settings.where(:plugin_id => obj).delete_all
  end

  def keywords
    self.plugins.map(&:keywords_hash).reduce Hash.new, :merge
  end

  def query(query)
    keys = self.keywords
    hits = query.split(" ") & keys.keys
    return "Not found" if hits.blank?
    data = []
    hits.each do |key|
      plugin = Plugin.find_by_keyword(key)
      data << plugin.perform(key,query)
    end
    data
  end


end
