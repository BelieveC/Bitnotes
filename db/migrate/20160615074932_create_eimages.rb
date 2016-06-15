class CreateEimages < ActiveRecord::Migration
  def change
    create_table :eimages do |t|

      t.timestamps null: false
    end
  end
end
