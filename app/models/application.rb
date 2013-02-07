class Application < ActiveRecord::Base
  attr_accessible :name
  belongs_to :user
  before_create :generate_access_token
  has_many :rrs
	validates :name, :uniqueness => true

	private

	def generate_access_token
	  begin
	    self.api_token = SecureRandom.hex
	  end while self.class.exists?(api_token: api_token)
	end

	def self.does_user_has_app_access(user_id, id)
		Application.where("id = ? and user_id = ?", id, user_id).first
	end
end