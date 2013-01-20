class PluginProject < ActiveRecord::Base
  belongs_to :plugin
  belongs_to :project
  # attr_accessible :title, :body
end
