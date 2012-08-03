class Following < ActiveRecord::Base
  #Following_id ele já tem, é quem está sendo seguido
  attr_accessible :accepted, :blocked, :profile_id
  #Profile_id é quem segue
  belongs_to :profile
  belongs_to :follower, :class_name => 'Profile'
end
