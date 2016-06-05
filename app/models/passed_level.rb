class PassedLevel < ActiveRecord::Base
  belongs_to :level
  belongs_to :user

  def self.open_new_level(user_id, level_order)
    level=Level.find_by order: level_order
    if level
      record_exist = self.find_by user_id: user_id, level_id: level.id
      if !record_exist
        passed_level=self.new
        passed_level.user_id = user_id
        passed_level.level_id=level.id
        passed_level.last_mission_order=1
        passed_level.save!
        level=passed_level.level
      end

    end
    level
  end

  def self.last_level(user)
    level=Level.find_by order:user.levels.maximum("order")
  end


  def self.next_mission(user_id)


  end


end
