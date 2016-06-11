class AddReturnTypeToTestCases < ActiveRecord::Migration
  def change
    add_column :test_cases, :return_type, :string
  end
end
