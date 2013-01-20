class Client < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  attr_accessible :api_key, :name, :project_id, :user_id

  validates_presence_of :name, :user, :project
  validates_uniqueness_of :api_key


  before_save :generate_api_key

  private

    def generate_api_key
      begin
        self.api_key = SecureRandom.hex
      end while self.class.exists?(api_key: api_key)
    end

end
