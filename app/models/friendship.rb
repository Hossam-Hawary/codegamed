class Friendship < ActiveRecord::Base
	belongs_to :user
    belongs_to :friend, class_name: "User"

	def self.facebook_friends_save(user)
	    facebook = Koala::Facebook::API.new(user.oauth_token)
		friends=facebook.get_object("/me/friends")
		    friends.each do |friend|
		    friendship=Friendship.new
		    friendship.user_id = user.id
		    friend_uid=friend["id"]
		    friend_obj=User.find_by_uid friend_uid
		    friendship.friend_id = friend_obj.id
		    friendship.accepted = "true"
		        friendship.save
		end
	end
end