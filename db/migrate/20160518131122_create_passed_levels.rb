class CreatePassedLevels < ActiveRecord::Migration
  def change
    create_table :passed_levels do |t|
      t.references :level, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :progress
      t.integer :last_mission_order

      t.timestamps null: false
    end
  end
end
