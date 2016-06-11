class CreateTestCases < ActiveRecord::Migration
  def change
    create_table :test_cases do |t|
      t.references :mission, index: true, foreign_key: true
      t.string :input
      t.string :output

      t.timestamps null: false
    end
  end
end
