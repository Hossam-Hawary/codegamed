class MissionsController < ApplicationController
  def new
    @mission=Mission.new
  end

  def index
    @missions=Mission.all
  end

  def create
    @mission=Mission.new(mission_params)


    Level.find_by id: @mission.level.missions.each do |mission|
      if mission.order>= @mission.order
        Mission.update(mission,"order"=>mission.order+1)
      end
    end


  end

  private
  def mission_params
    params.require(:mission).permit(:order,:level_id,:video_url,:score,:problem)
  end
end
