class CreateSimages < ActiveRecord::Migration
  def change
    create_table :simages do |t|

      t.timestamps null: false
    end
  end
end
