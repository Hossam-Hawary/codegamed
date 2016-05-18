class PassedLevel < ActiveRecord::Base
  belongs_to :level
  belongs_to :user
end
