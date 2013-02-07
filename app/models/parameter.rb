class Parameter < ActiveRecord::Base
  attr_accessible :key, :param_type, :value, :rr_id
  belongs_to :rr
  validates   :key, :value, :rr_id, :param_type, :presence => true
end
