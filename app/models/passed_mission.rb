class PassedMission < ActiveRecord::Base
  belongs_to :user
  belongs_to :mission

  def self.open_new_mission(user_id,mission_order)

    @mission_one = self.new
    @mission_one.user_id = user_id
    last_passed_level = (User.find_by id:user_id).levels.maximum("order")
    mission_id = Mission.find_by order:mission_order,level_id:last_passed_level
    @mission_one.mission_id = mission_id.id
    @mission_one.save

  end


end
