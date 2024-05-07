class CreateTestCycleDays < ActiveRecord::Migration[7.1]
  def change
    create_table :test_cycle_days do |t|
      t.references :test_cycle, null: false, foreign_key: true
      t.integer :day_number
      t.string :mucus
      t.float :temp

      t.timestamps
    end
  end
end
