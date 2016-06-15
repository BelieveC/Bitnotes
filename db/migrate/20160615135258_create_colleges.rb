class CreateColleges < ActiveRecord::Migration
  def change
    create_table :colleges do |t|
      t.string :name
      t.string :address
      t.string :user_name
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
