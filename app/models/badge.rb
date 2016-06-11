class Badge < ActiveRecord::Base
  has_many :user_badges
  has_many :users , through: :user_badges
  has_many :level
  mount_uploader :image_url, BadgeUploader
  validates :title, :image_url,:presence => true
  validate  :image_size
private
  # Validates the size of an uploaded picture.
  def image_size
    if :image_url.size > 2.megabytes
      errors.add(:image_url, "should be less than 2MB")
    end
  end

end
