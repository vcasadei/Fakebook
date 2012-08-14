class Relationship < ActiveRecord::Base
  attr_accessible :followed_id, :follower_id
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  #Associations
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  #Functions
  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end
end
