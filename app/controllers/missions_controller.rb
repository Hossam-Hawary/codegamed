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
        format.html { redirect_to missions_path, notice: 'Mission was successfully created.' }
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
        format.html { redirect_to missions_path, notice: 'Mission was successfully updated.' }
        format.json { render :index , status: :ok, location: Mission }
      else
        format.html { render :edit }
        format.json { render json: Mission.errors, status: :unprocessable_entity }
      end
    end
end



  def show_user_missions

    level_id = params[:level_id]
    decrypt_data = AESCrypt.decrypt(level_id, 'codeGamed_Secret_Key')
    level = Level.find_by_id(decrypt_data)


    if current_user.levels.include?(level)
      @missions = Level.find_by_id(decrypt_data)
      render :json =>  {'key':'Success','missions': @missions,'level_id':decrypt_data}
    else
      render :json =>  {'key':'false'}
    end

    rescue Exception
    render :json =>  {'key':'false'}

  end

  private

  def mission_params
    params.require(:mission).permit(:order,:level_id,:video_url,:score,:problem,:initial_code)
  end

end
