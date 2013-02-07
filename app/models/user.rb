class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :applications
	
	def get_my_application(id, user_id)
		Application.where("id = ? and user_id = ?", id, user_id).first
	end

end
