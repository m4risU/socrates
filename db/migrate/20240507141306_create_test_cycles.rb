class CreateTestCycles < ActiveRecord::Migration[7.1]
  def change
    create_table :test_cycles do |t|
      t.string :name

      t.timestamps
    end
  end
end
