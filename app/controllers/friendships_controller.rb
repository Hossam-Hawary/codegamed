class FriendshipsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create,:update,:destroy]
    def create
      @friendship = current_user.friendships.build(friend_id: params[:friend_id])
     	@friendship.update(accepted: "false")
      if @friendship.save
        flash[:notice] = "Friend requested."
        render :json => {'result':'success'}
      else
        flash[:error] = "Unable to request friendship."
        render :json => {'result':'failed'}
      end
    end

    def update
	    @friendship = Friendship.find_by(user_id: params[:id] , friend_id: current_user)
	    	@friendship.update(accepted: "true")
	      if @friendship.save
	        render :json => {'result':'success','friend_score':@friendship.user.total_score}
	      else
          render :json => {'result':'failed'}
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
      render :json => {'result': 'success'}
    end
end
