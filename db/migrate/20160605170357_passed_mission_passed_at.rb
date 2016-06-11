class PassedMissionPassedAt < ActiveRecord::Migration
  def change
    add_column :passed_missions, :passed_at, :datetime
  end
end
