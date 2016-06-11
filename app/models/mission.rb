class Mission < ActiveRecord::Base
  belongs_to :level
  has_many :test_cases
  has_many :passed_missions
  has_many :users, through: :passed_missions
  validates :level_id, :problem,:score,:presence => true
  validates :order, :numericality => { :greater_than_or_equal_to => 0 }
end
