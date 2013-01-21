class Setting < ActiveRecord::Base
  belongs_to :plugin
  attr_accessible :name, :plugin_id
end
