class MainPageController < ApplicationController
def list_user_friends
  @friends=[]
  

  current_user.friends.each do |friend|
  	@friend={}
    @friend[:id] = friend.id
    @friend[:name] = friend.name
    @friend[:image] = friend.image_url
    @friend[:score] = friend.total_score
    @friends.push(@friend)
  end

  render :json => {'friends':@friends , 'requests':current_user.requested_friendships.select("name,image_url,friend_id,total_score")}

end

def search_for_new_friends

  @search_word = params[:search_word]
  @current_user_new_friends = User.where("name LIKE '%#{@search_word}%'").select("name,image_url,id") - current_user.all_friendships

  render :json => {'new_friends':@current_user_new_friends}
end
end
