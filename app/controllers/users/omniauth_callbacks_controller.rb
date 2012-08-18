class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in @user, :event => :authentication
      if @user.sign_in_count == 1
      	#@user.build_profile
      	@user.profile=@user.create_profile
      	#@user.profile=@user.profile.create()
      	#redirect_to '/profiles/edit'
      	redirect_to '/home/index'
      	else
      	redirect_to '/home/index' #precisa deixar mais restful
      end
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
    
    
  end
  
  def after_sign_up_path_for(resource)
   '/profiles/new'
  
end
end

