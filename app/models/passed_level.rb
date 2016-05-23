class PassedLevel < ActiveRecord::Base
  belongs_to :level
  belongs_to :user

  def self.set_level(user_id)
    where(user_id: user_id).first_or_initialize do |passed_level|
      passed_level.user_id = user_id
      passed_level.level_id=1
      passed_level.last_mission_order=1
      passed_level.save!
    end
  end

end
