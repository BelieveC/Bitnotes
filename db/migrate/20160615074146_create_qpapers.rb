class CreateQpapers < ActiveRecord::Migration
  def change
    create_table :qpapers do |t|
      t.string :examname
      t.date :date
      t.text :description
      t.integer :college_id
      t.integer :subject_id
      t.string :subject
      t.string :college
      t.integer :user_id
      t.string :user_name

      t.timestamps null: false
    end
  end
end
