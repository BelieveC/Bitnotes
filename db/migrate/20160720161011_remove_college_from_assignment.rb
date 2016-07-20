class RemoveCollegeFromAssignment < ActiveRecord::Migration
  def change
    remove_column :assignments, :college, :string
  end
end
