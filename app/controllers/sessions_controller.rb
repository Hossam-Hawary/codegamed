class SessionsController < ApplicationController
  def create
  user_exist = User.find_by uid:env["omniauth.auth"].uid
    if !user_exist
        user_exist = User.from_omniauth(env["omniauth.auth"])
    Friendship.facebook_friends_save user_exist
    #@facebook = Koala::Facebook::API.new(user.oauth_token)
    #@facebook.get_object("me?fields=friends,taggable_friends")
  end
      session[:user_id] = user_exist.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/#/"
  end

  private
  def user_params
    params.require(:user).permit(:provider, :name, :uid, :oauth_token, :oauth_expires_at)
  end

end
