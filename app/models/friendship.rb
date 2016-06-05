class Friendship < ActiveRecord::Base
	belongs_to :user
    belongs_to :friend, class_name: "User"

    def facebook_friends_save()
    	facebook = Koala::Facebook::API.new(current_user.oauth_token)
  		@friends=facebook.get_object("/me/friends")
  		@friends.each do |friend|
  			@Friendship.new
  			@Friendship[:user_id] = current_user.uid
		 	@Friendship[:friend_id] = friend.id
		 	@Friendship[:accepted] = 1
		 	@Friendship.save
		end 

    end
end
