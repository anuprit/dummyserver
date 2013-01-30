class Header < ActiveRecord::Base
  attr_accessible :key, :rr_id, :value
  belongs_to :rr
end