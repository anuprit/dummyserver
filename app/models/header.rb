class Header < ActiveRecord::Base
  attr_accessible :key, :rr_id, :value
  belongs_to :rr

  validates   :key, :value, :rr_id, :presence => true

  def self.get_request_header(id, rr, user)
  	Header.where("id = ? and rr_id = ?", id, rr.id).first if rr.application.user == user
  end
end