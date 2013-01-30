class Rr < ActiveRecord::Base
  attr_accessible :response, :url
  belongs_to :user
  has_many :headers, :as => :header
end
