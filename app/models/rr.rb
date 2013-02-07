class Rr < ActiveRecord::Base
  attr_accessible :response, :url
  belongs_to :user
  has_many :headers, :as => :header
  has_many :parameters
  belongs_to :application

  validates   :response, :presence => true
  validates   :url, :presence => true
end
