class PassedLevel < ActiveRecord::Base
  belongs_to :level
  belongs_to :user

  def self.open_new_level(user_id, level_order)
    level=Level.find_by order: level_order
    if level
        passed_level=self.new
        passed_level.user_id = user_id
        passed_level.level_id=level.id
        passed_level.last_mission_order=1
        passed_level.progress=0
        passed_level.save!
        level=passed_level.level
    else
      level=Level.find_by order: level_order-1
    end
    level
  end
  def self.raise_progress(user,mission)
    passed_level=PassedLevel.find_by user_id:user.id, level_id:mission.level.id
    progress=(mission.order.to_f/mission.level.missions.size)*100
    passed_level.progress=progress
    passed_level.save!
  end

  def self.last_level(user)
    level=Level.find_by order:user.levels.maximum("order")
  end

  def loched_missions
    all_missions=self.level.missions
  end

end
