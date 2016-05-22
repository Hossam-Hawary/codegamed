class TestCase < ActiveRecord::Base
  belongs_to :mission
  validates :input,:output ,:presence => true

end
