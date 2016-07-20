class RemoveUserNameFromSubject < ActiveRecord::Migration
  def change
    remove_column :subjects, :user_name, :string
  end
end
