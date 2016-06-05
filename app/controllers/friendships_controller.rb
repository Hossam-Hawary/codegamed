class FriendshipsController < ApplicationController
    
    def create
      @friendship = current_user.friendships.build(friend_id: params[:friend_id])
     	@friendship.update(accepted: "false")
      if @friendship.save
        flash[:notice] = "Friend requested."
        redirect_to :back
      else
        flash[:error] = "Unable to request friendship."
        redirect_to root_url
      end
    end

    def update
	    @friendship = Friendship.find_by(user_id: params[:id] , friend_id: current_user)
	    	@friendship.update(accepted: "true")
	      if @friendship.save
	        redirect_to :back, notice: "Successfully confirmed friend!"
	      else
	        redirect_to root_url, notice: "Sorry! Could not confirm friend!"
	      end
    end

    def index
    	@all=User.all
    	@friends=current_user.all_friendships
    	@users=@all-@friends
    end

    def destroy
      @friendship = Friendship.find_by user_id: params[:id], friend_id: current_user.id
    	if !@friendship
          @friendship = Friendship.find_by user_id: current_user.id, friend_id: params[:id]
    	end
      @friendship.destroy
      flash[:notice] = "Removed friendship."
      redirect_to :back
    end
end
