class AddInitialCodeToMission < ActiveRecord::Migration
  def change
    add_column :missions,:initial_code,:text
  end
end
