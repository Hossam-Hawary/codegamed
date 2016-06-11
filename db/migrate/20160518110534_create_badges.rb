class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :title
      t.string :image_url

      t.timestamps null: false
    end
  end
end
