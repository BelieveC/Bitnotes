class RemoveUserNameFromCollege < ActiveRecord::Migration
  def change
    remove_column :colleges, :user_name, :string
  end
end
