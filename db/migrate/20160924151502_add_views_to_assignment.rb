class AddViewsToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :views, :integer
    add_column :colleges, :views, :integer
    add_column :subjects, :views, :integer
    add_column :examnotes, :views, :integer
    add_column :qpapers, :views, :integer
  end
end
