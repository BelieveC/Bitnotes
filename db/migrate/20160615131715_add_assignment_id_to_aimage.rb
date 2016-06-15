class AddAssignmentIdToAimage < ActiveRecord::Migration
  def change
    add_column :aimages, :assignment_id, :integer
    add_index :aimages, :assignment_id
  end
end
