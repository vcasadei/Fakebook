class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)

   @user = User.find(current_user.id)
   @user.update_attributes(:signed_in => '1')
   session[:chat_user] = @user.id

   edit_profile_path(current_user.profile)
  
  end

end
