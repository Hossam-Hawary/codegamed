class Level < ActiveRecord::Base
  belongs_to :badge
  has_many :missions
  has_many :passed_levels
  has_many :users, through: :passed_levels


end
