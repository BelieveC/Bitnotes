class AddCollegeIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :college_id, :integer
  end
end
