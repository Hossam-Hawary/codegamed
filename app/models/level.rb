class Level < ActiveRecord::Base
  belongs_to :badge
  has_many :missions ,:dependent =>  :destroy
  has_many :passed_levels, :dependent =>  :destroy
  has_many :users, through: :passed_levels,:dependent =>  :destroy
  # before_save do|current_level|
  #   reset_order(current_level)
  # end

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
