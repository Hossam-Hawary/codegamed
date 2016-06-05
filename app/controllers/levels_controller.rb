class LevelsController < ApplicationController
# before_filter :login
# before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_filter :login, :only => [:show_user_levels]
#all actions using the methods post/put/delete where recognized as forgery attempts so we stoped the authnticity token
  skip_before_filter :verify_authenticity_token, :only => [:show_user_levels, :show_user_missions]
  before_action :authenticate_admin!, :only => [:index, :new, :create, :update, :edit]

  def login
    if current_user == nil
      redirect_to root_path
    end
  end

  def index
    @levels = Level.order("levels.order").all
  end

  def new
    @level=Level.new
  end

  def create
    @level = Level.new(level_params)
    if @level.order
      @level.order+=1
      if @level.order <= Level.maximum("order")
        # resort the levels
        Level.where("levels.order >= #{@level.order}").each do |level|
          Level.update(level, "order" => level.order+1)
        end

      end
    else
      @level.order=1
    end
    respond_to do |format|
      if @level.save
        format.html { redirect_to levels_path, notice: 'Level was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  def edit
    @level = Level.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def update
    @level = Level.find(params[:id])
    @level_params = level_params
    # when admin changes level order from small to big no.
    if @level_params[:order].to_i >= @level.order.to_i
      Level.where("levels.order > #{@level.order} ").each do |level|
        if @level_params['order'].to_i >= level.order
          Level.update(level, "order" => level.order-1)
        end
      end
      # when admin changes level order from big to small no.
    else
      @level_params[:order].to_i <= @level.order.to_i
      Level.where("levels.order >= #{@level_params['order'].to_i} ").each do |level|
        if level.order < @level.order
          Level.update(level, "order" => level.order+1)
        end
      end
    end
    respond_to do |format|
      if @level.update(@level_params)
        format.html { redirect_to levels_path, notice: 'Levels was successfully updated.' }
        format.json { render :index, status: :ok, location: Level }
      else
        format.html { render :edit }
        format.json { render json: Level.errors, status: :unprocessable_entity }
      end
    end
  end

  def show_user_levels

  	@badges = Level.user_opened_levels(current_user)

   	@locked_levels = Level.locked_badges(current_user)

	 @friends=[]
	 @friend={}

	 current_user.friends.each do |friend|
	 	@friend[:name] = friend.name
	 	@friend[:image] = friend.image_url
	 	@friend[:score] = friend.total_score
	 	@friends.push(@friend)
	 end 

    render :json => {'badges': @badges, 'locked_levels': @locked_levels,'friends':@friends}

  end


  private
  def level_params
    params.require(:level).permit(:order, :badge_id)
  end
end