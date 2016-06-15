class CreatePimages < ActiveRecord::Migration
  def change
    create_table :pimages do |t|

      t.timestamps null: false
    end
  end
end
