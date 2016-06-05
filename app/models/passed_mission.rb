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

  def self.pass_mission(user, mission)
    next_mission_order= mission.order+1
    level=mission.level
    last_mission=level.missions.order("missions.order").last

    output={output: 'Success', next_level: "same"}

    if last_mission.order==mission.order
      level= PassedLevel.open_new_level(user.id, mission.level.id + 1)
      next_mission_order=1
      output[:next_level]=mission.level.order+1
      output[:next_mission]=self.missions_with_test_cases(user, mission.level)
    end

    self.open_new_mission(user.id, next_mission_order, mission.level.id)
    output[:missions]= self.missions_with_test_cases(user,level)

    output
  end


  def self.missions_with_test_cases(user, level)
    full_missions=[]
    user.missions.where("level_id = #{level.id}").order(:order).each do |mission|
      mission_test_cases=TestCase.where( mission_id: mission.id)
      full_missions<<{mission_data: mission, mission_test_cases: mission_test_cases}
    end
    return full_missions
  end
end
