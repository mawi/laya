module ActiveRecordExtensions
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def find_or_create(attributes)
      self.where(attributes).instance_eval{|q| q.first || q.create}
    end
    alias create_or_find find_or_create
  end
end

ActiveRecord::Base.send(:include, ActiveRecordExtensions)