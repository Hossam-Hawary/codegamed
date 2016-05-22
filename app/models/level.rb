class Level < ActiveRecord::Base
  belongs_to :badge
  has_many :missions ,:dependent =>  :destroy
  has_many :passed_levels, :dependent =>  :destroy
  has_many :users, through: :passed_levels,:dependent =>  :destroy


end
