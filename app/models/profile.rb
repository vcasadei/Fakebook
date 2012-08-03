class Profile < ActiveRecord::Base
  attr_accessible :about, :birthday, :city, :college, :contact_email, :country,
                  :full_name, :gender, :high_school, :state, :website, :work_at
  belongs_to :user
  has_many :followings
  has_many :followers, :through => :followings
end
