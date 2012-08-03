class Following < ActiveRecord::Base
  attr_accessible :accepted, :blocked
  
  belongs_to :profile
end
