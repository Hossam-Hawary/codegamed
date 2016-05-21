class Mission < ActiveRecord::Base
  belongs_to :level
  validates :level_id, :problem,:score,:presence => true

end
