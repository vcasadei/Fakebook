class Relationship < ActiveRecord::Base
  attr_accessible :followed_id, :follower_id
  #Associations
  #belongs_to :profile
  belongs_to :follower, class_name: "Profile"
  belongs_to :followed, class_name: "Profile"
end