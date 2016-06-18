class CreateCimages < ActiveRecord::Migration
  def change
    create_table :cimages do |t|

      t.timestamps null: false
    end
  end
end
