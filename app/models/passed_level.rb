class PassedLevel < ActiveRecord::Base
  belongs_to :level
  belongs_to :user

  def self.set_level(user_id)

    passed_level=self.new
    passed_level.user_id = user_id
    passed_level.level_id=(Level.find_by order: 1).id
    passed_level.last_mission_order=1
    passed_level.save!

  end


  def self.next_mission(user_id)



  end


end
