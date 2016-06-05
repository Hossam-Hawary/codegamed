class User < ActiveRecord::Base
  has_many :user_badges
  has_many :badges ,through: :user_badges
  has_many :passed_levels
  has_many :levels, through: :passed_levels
  has_many :passed_missions
  has_many :missions, through: :passed_missions
  after_create :open_first_level_and_mission

# Check user existance in db and save new users 
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.image_url = auth.info.image
      user.email=auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.total_score=0
      user.save!

    end
  end
  def rais_score(mission)
    last_passed_mission=self.missions.last
    if last_passed_mission==mission
    User.update(self, "total_score" => self.total_score + mission.score)
    end
  end

  private
  def open_first_level_and_mission
    PassedLevel.open_new_level(self.id,1)
    PassedMission.open_new_mission(self.id,1,(PassedLevel.last_level self).id)
  end
end
