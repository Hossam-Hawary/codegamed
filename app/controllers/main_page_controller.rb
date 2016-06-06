class MainPageController < ApplicationController
def list_user_friends
  @friends=[]
  

  current_user.friends.each do |friend|
  	@friend={}
    @friend[:name] = friend.name
    @friend[:image] = friend.image_url
    @friend[:score] = friend.total_score
    @friends.push(@friend)
  end

  render :json => {'friends':@friends}

end
end
