class Mission < ActiveRecord::Base
  belongs_to :level
  has_many :test_cases
  validates :level_id, :problem,:score,:presence => true

end
