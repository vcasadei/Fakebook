class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid, :online, :signed_in, :privacy
  # attr_accessible :title, :body
  has_one :profile, dependent:   :destroy
  accepts_nested_attributes_for :profile
  after_initialize :init
#	accepts_nested_attributes_for :profile
	attr_accessible :profile_attributes
#do omniuath-facebook
def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
  user = User.where(:provider => auth.provider, :uid => auth.uid).first
#	nprofile=Profile.create()

  unless user
    user = User.create( provider:auth.provider,
                         uid:auth.uid,
                         email:auth.info.email,
                         password:'123456'
#			#profile: Profile.create()
                         )
	
  end
#user.profile.build()
#self.profile||=self.build_profile()

user

 
end

def with_profile
  self.profile.build
  self
end


def init
	self.privacy ||='1'
end


def self.new_with_session(params, session)
	#user.profile=user.profile.build()
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
