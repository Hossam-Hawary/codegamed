class User < ActiveRecord::Base
  has_many :user_badges
  has_many :badges ,through: :user_badges
  has_many :passed_levels
  has_many :levels, through: :passed_levels
  has_many :passed_missions
  has_many :missions, through: :passed_missions
  after_save :open_first_level_and_mission

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
      user.save!

    end
  end
  private
  def open_first_level_and_mission
    user_id=User.maximum("id")
    PassedLevel.open_new_level(user_id,1)
    PassedMission.open_new_mission(user_id,1,(PassedLevel.last_level current_user).id)
  end
end
