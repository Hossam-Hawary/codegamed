class CreatePassedMissions < ActiveRecord::Migration
  def change
    create_table :passed_missions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :mission, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
