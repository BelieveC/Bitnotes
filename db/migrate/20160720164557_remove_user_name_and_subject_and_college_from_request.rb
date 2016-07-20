class RemoveUserNameAndSubjectAndCollegeFromRequest < ActiveRecord::Migration
  def change
    remove_column :requests, :user_name, :string
    remove_column :requests, :subject, :string
    remove_column :requests, :college, :string
  end
end
