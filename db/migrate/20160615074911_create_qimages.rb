class CreateQimages < ActiveRecord::Migration
  def change
    create_table :qimages do |t|

      t.timestamps null: false
    end
  end
end
