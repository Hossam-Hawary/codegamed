class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.integer :order
      t.integer :score
      t.references :level, index: true, foreign_key: true
      t.string :video_url
      t.text :problem

      t.timestamps null: false
    end
  end
end
