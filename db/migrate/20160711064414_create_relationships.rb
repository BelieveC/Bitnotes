class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :subscriber_id
      t.integer :subscribed_id

      t.timestamps null: false
    end
    add_index :relationships, :subscriber_id
    add_index :relationships, :subscribed_id
    add_index :relationships, [:subscriber_id,:subscribed_id], unique: true
  end
end
