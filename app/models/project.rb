class Project < ActiveRecord::Base
  has_many :clients
  has_many :plugin_projects
  has_many :plugins, :through => :plugin_projects

  attr_accessible :description, :name
  validates_presence_of :name


end
