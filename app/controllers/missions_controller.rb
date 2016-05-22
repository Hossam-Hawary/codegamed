class MissionsController < ApplicationController
  def new
    @mission=Mission.new
  end

  def index
    @missions=Mission.order("level_id").all
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

  private
  def mission_params
    params.require(:mission).permit(:order,:level_id,:video_url,:score,:problem,:initial_code)
  end
end