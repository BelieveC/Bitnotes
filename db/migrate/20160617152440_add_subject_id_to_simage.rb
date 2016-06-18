class AddSubjectIdToSimage < ActiveRecord::Migration
  def change
    add_column :simages, :subject_id, :integer
    add_index :simages, :subject_id
  end
end
