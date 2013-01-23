class Plugin < ActiveRecord::Base
  has_many :keywords
  has_many :plugin_projects
  has_many :projects, :through => :plugin_projects
  has_many :settings

  attr_accessible :name, :description

  def keywords_hash
    Plugin.first.keywords.inject({}) do |h, x|
      h.merge!({x.keyword => x.trigger})
    end
  end

  def perform(key,query)
    klass = eval(self.name.camelize) # TODO add it in db
    trigger = self.keywords.where(:keyword => key).first.trigger
    klass::Triggers.send(trigger,query)
  end


  def self.find_by_keyword(keyword)
    Plugin.joins(:keywords).where("keywords.keyword = '#{keyword}'").first
  end

end
