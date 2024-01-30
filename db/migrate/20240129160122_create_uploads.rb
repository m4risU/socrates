class CreateUploads < ActiveRecord::Migration[7.1]
  def change
    create_table :uploads do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
