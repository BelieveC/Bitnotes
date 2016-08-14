class CreateSpams < ActiveRecord::Migration
  def change
    create_table :spams do |t|
      t.integer :user_id
      t.integer :count
      t.integer :type_id
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
