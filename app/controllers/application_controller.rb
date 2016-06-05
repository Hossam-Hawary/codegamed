class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

#  def friends
# 	facebook = Koala::Facebook::API.new(current_user.oauth_token)
#     @friends=facebook.get_object(current_user.uid+"/friends?access_token="+current_user.oauth_token)
# end
  helper_method :current_user #,:friends
end
