class MissionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:show_user_missions]
  def new
    @mission=Mission.new
  end

  def index
    @missions=Mission.order("level_id","missions.order").all
  end

  def create
    @mission=Mission.new(mission_params)

    maxorder=((Level.find_by id: @mission.level).missions.maximum("order"))
    if maxorder
      if @mission.order.nil?||@mission.order<1||@mission.order>(maxorder+1)
        @mission.order=maxorder+1
      end
    else
      @mission.order=1
    end
    (Level.find_by id: @mission.level).missions.each do |mission|
      if mission.order>= @mission.order
        Mission.update(mission,"order"=>mission.order+1)
      end
    end

    respond_to do |format|
      if @mission.save
        format.html { redirect_to levels_path, notice: 'Mission was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  
def edit
   @mission = Mission.find(params[:id])
    respond_to do |format|
      format.html
  end
end

def update
  @mission = Mission.find(params[:id])
  maxorder=((Level.find_by id: @mission.level).missions.maximum("order"))
  @mission_params = mission_params
      # when admin changes mission order from small to big no.    
  if @mission_params[:order].to_i >= @mission.order.to_i
    if @mission_params[:order].to_i>(maxorder) #condition lw7dha||@mission_params[:order].nil?
      @mission_params[:order]=maxorder
    end
    (Level.find_by id: @mission.level).missions.each do |level_mission|
    if level_mission.order <= @mission_params[:order].to_i
      if level_mission.order > @mission.order
          Mission.update(level_mission,"order"=>level_mission.order-1)
      end
    end
  end
      # when admin changes mission order from big to small no.    
  else @mission_params[:order].to_i <= @mission.order.to_i
     (Level.find_by id: @mission.level).missions.each do |level_mission|
       if level_mission.order >= @mission_params[:order].to_i
          if level_mission.order < @mission.order
            Mission.update(level_mission,"order"=>level_mission.order+1)
          end
      end
  end
end
      # if @mission_params[:order].nil?||@mission_params[:order].to_i<1||mission_params[:order].to_i>(maxorder+1)
      #   @mission_params[:order]=maxorder+1
      # end

    # (Level.find_by id: @mission.level).missions.each do |mission|
    #   if mission.order>= @mission.order
    #     Mission.update(mission,"order"=>mission.order+1)
    #   end
    # end

    respond_to do |format|
      if @mission.update(@mission_params)
        format.html { redirect_to levels_path, notice: 'Mission was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
end



  def show_user_missions

    level_id = params[:level_id]
    decrypt_data = AESCrypt.decrypt(level_id, 'codeGamed_Secret_Key')
    level = Level.find_by_id(decrypt_data)


    # Check if the Level id got from the POST request is included in the User Levels or not
    # if true, I render the @missions of the this level to the user
    # if false, I render a json of value false

    if current_user.levels.include?(level)
      last_mission = current_user.passed_levels.where(level_id: decrypt_data).first.last_mission_order
      missions = Mission.arel_table
      @missions = Mission.where(missions[:level_id].eq(decrypt_data.to_i).and(missions[:order].lteq(last_mission)))

      render :json =>  {'accessing_level_status':'Success','missions': @missions, 'level_id':decrypt_data,'last_mission_order': last_mission}
    else
      render :json =>  {'accessing_level_status':'false'}
    end

    # Handling the exception raised when the AESCrypt,decrypt can't decrypt the level id
    rescue Exception
    render :json =>  {'accessing_level_status':'false'}

  end

  private

  def mission_params
    params.require(:mission).permit(:order,:level_id,:video_url,:score,:problem,:initial_code)
  end

end
