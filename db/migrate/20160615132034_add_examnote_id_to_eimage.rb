class AddExamnoteIdToEimage < ActiveRecord::Migration
  def change
    add_column :eimages, :examnote_id, :integer
    add_index :eimages, :examnote_id
  end
end
