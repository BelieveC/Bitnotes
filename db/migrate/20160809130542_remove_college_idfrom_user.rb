class RemoveCollegeIdfromUser < ActiveRecord::Migration
  def change
  	remove_columns :users,:college_id
  end
end
