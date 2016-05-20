class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string :image_url
      t.string :email
      t.integer :total_score

      t.timestamps null: false
    end
  end
end