class RemoveUserNameAndSubjectAndCollegeFromQpaper < ActiveRecord::Migration
  def change
    remove_column :qpapers, :user_name, :string
    remove_column :qpapers, :subject, :string
    remove_column :qpapers, :college, :string
  end
end
