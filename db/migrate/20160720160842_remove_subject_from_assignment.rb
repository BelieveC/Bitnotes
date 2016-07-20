class RemoveSubjectFromAssignment < ActiveRecord::Migration
  def change
    remove_column :assignments, :subject, :string
  end
end
