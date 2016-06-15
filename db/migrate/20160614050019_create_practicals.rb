class CreatePracticals < ActiveRecord::Migration
  def change
    create_table :practicals do |t|
      t.string :title
      t.string :aim
      t.integer :subject_id
      t.integer :college_id
      t.text :description
      t.string :user_name
      t.integer :user_id
      t.string :subject
      t.string :college

      t.timestamps null: false
    end
    add_index :practicals, :user_id
  end
end
