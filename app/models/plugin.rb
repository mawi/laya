class Plugin < ActiveRecord::Base
  has_many :keywords
  has_many :plugin_projects
  has_many :projects, :through => :plugin_projects

  attr_accessible :name, :description

end
