class CreateWebhooks < ActiveRecord::Migration[7.0]
  def change
    create_table :webhooks do |t|
      t.string :name
      t.string :secret
      t.string :url
      t.string :event

      t.timestamps
    end
  end
end
