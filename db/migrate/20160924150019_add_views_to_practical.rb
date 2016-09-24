class AddViewsToPractical < ActiveRecord::Migration
  def change
    add_column :practicals, :views, :integer
  end
end
