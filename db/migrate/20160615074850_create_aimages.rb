class CreateAimages < ActiveRecord::Migration
  def change
    create_table :aimages do |t|

      t.timestamps null: false
    end
  end
end
