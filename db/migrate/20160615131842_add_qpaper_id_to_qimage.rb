class AddQpaperIdToQimage < ActiveRecord::Migration
  def change
    add_column :qimages, :qpaper_id, :integer
    add_index :qimages, :qpaper_id
  end
end
