class RemoveUserNameAndSubjectAndCollegeFromPractical < ActiveRecord::Migration
  def change
    remove_column :practicals, :user_name, :string
    remove_column :practicals, :subject, :string
    remove_column :practicals, :college, :string
  end
end
