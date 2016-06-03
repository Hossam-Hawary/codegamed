class Level < ActiveRecord::Base
  belongs_to :badge
  has_many :missions ,:dependent =>  :destroy
  has_many :passed_levels, :dependent =>  :destroy
  has_many :users, through: :passed_levels,:dependent =>  :destroy
  # before_save do|current_level|
  #   reset_order(current_level)
  # end

  def self.user_opened_levels(current_user)
    @levels = current_user.levels.order(order: :asc)
    @temp_badge = {}
    @badges = []

    @levels.each do |level|

      encrypted_id = AESCrypt.encrypt(level.id, 'codeGamed_Secret_Key')

      @temp_badge[:level_id] = encrypted_id #encrypted_id

      @temp_badge[:title] = level.badge.title
      @temp_badge[:image_url] = level.badge.image_url

      @badges.push(@temp_badge)

      #must be emptied to store the next value don't try to remove
      @temp_badge= {}
    end

    @badges

  end


  def self.locked_badges(current_user)
  @locked_levels = Level.all() - current_user.levels

  @locked_badges = []

  @locked_levels.each do |level|
      @locked_badges.push(level.badge)
    end

  @locked_badges
  end


private
  def reset_order(current_level)
      if current_level.order <= Level.maximum("order")
        # resort the levels
        Level.where("levels.order >= #{current_level.order}").each do |level|
          Level.update(level, "order" => level.order+1)
        end

      end

  end
  # def valid_order
  #   if :order
  #
  #   end
  # end

end
