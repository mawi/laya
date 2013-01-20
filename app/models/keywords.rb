class Keywords < ActiveRecord::Base
  belongs_to :plugin
  attr_accessible :keyword, :trigger, :plugin_id
end
