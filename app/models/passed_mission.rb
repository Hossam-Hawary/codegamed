class PassedMission < ActiveRecord::Base
  belongs_to :user
  belongs_to :mission
  def self.open_first_mission(user)

    @mission_one=self.new
    @mission_one.user_id=user
    last_level_id=Level.maximum("order")
    mission_id=Mission.find_by order:1,level_id:last_level_id
    @mission_one.mission_id=mission_id.id
    @mission_one.save

  end
end
