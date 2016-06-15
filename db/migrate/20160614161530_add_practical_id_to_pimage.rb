class AddPracticalIdToPimage < ActiveRecord::Migration
  def change
    add_column :pimages, :practical_id, :integer
    add_index :pimages, :practical_id
  end
end
