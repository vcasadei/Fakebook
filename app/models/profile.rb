class Profile < ActiveRecord::Base
  attr_accessible :about, :birthday, :city, :college, :contact_email, :country,
                  :full_name, :gender, :high_school, :state, :website, :work_at
  #Some fields validations 
  validates :about,
            :length => { :minimum =>3, :maximum => 500 }
  validates :contact_email,
            :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :full_name,
            :presence => true,
            :length => { :maximum => 40 }
  validates :gender,
            :inclusion => %w(male female)
  #Associations          
  belongs_to :user
end
