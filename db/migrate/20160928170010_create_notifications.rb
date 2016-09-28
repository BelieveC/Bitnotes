class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :count
      t.integer :subscription_id

      t.timestamps null: false
    end
  end
end
