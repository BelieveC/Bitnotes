class RemoveUserNameFromAssignment < ActiveRecord::Migration
  def change
    remove_column :assignments, :user_name, :string
  end
end
