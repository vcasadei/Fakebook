class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)

    @user = User.find(current_user.id)
    @user.update_attributes(:signed_in => '1')
    session[:chat_user] = @user.id

    '/'

  end

  def after_sign_out_path_for(resource)
	if User.exists?(:chat_user)
    @user = User.find(session[:chat_user])
    @user.update_attributes(:signed_in => '0')
	end
    '/'

  end

end
