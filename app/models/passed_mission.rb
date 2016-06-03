class PassedMission < ActiveRecord::Base
  belongs_to :user
  belongs_to :mission

  def self.open_new_mission(user_id, mission_order, level_id)
    mission = Mission.find_by order: mission_order, level_id: level_id
    record_exist=self.find_by mission_id: mission.id, user_id: user_id
    if !record_exist
      @mission_one = self.new
      @mission_one.user_id = user_id
      @mission_one.mission_id = mission.id
      @mission_one.save
    end

  end

end
