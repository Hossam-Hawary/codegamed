class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.references :badge, index: true, foreign_key: true
      t.integer :order

      t.timestamps null: false
    end
  end
end
