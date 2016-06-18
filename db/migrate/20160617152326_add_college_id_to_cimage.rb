class AddCollegeIdToCimage < ActiveRecord::Migration
  def change
    add_column :cimages, :college_id, :integer
    add_index :cimages, :college_id
  end
end
