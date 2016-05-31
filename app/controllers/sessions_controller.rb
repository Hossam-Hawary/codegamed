class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    #@facebook = Koala::Facebook::API.new(user.oauth_token)
    #@facebook.get_object("me?fields=friends,taggable_friends")
    PassedLevel.set_level(user.id)
    PassedMission.open_first_mission(user.id)
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
