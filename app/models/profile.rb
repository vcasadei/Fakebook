class Profile < ActiveRecord::Base
  attr_accessible :about, :birthday, :city, :college, :contact_email, :country,
                  :full_name, :gender, :high_school, :state, :website, :work_at
  #Some fields validations 
 # validates :about,
 #           :length => { :minimum =>3, :maximum => 500 }
 # validates :contact_email,
 #           :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
 # validates :full_name,
 #           :presence => true,
 #           :length => { :maximum => 40 }
 # validates :gender,
 #           :inclusion => %w(male female)
  #Associations          
  belongs_to :user
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
attr_accessible :profile_attributes
has_many :eventos, dependent: :destroy
 has_many :participacao_eventos, foreign_key:"profile_id"
 has_many :participations, through: :participacao_eventos, source: :evento

  #Functions
  def following?(other_profile)
    relationships.find_by_followed_id(other_profile.id)
  end

  def follow!(other_profile)
    relationships.create!(followed_id: other_profile.id)
  end

  def unfollow!(other_profile)
    relationships.find_by_followed_id(other_profile.id).destroy
  end
end
