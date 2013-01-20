class Project < ActiveRecord::Base
  has_many :clients
  has_many :plugin_projects
  has_many :plugins, :through => :plugin_projects
  has_many :project_settings

  attr_accessible :description, :name, :project_settings_attributes
  validates_presence_of :name

  accepts_nested_attributes_for :project_settings


end
