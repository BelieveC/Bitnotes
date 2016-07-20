class RemoveUserNameAndSubjectAndCollegeFromExamnote < ActiveRecord::Migration
  def change
    remove_column :examnotes, :user_name, :string
    remove_column :examnotes, :subject, :string
    remove_column :examnotes, :college, :string
  end
end
