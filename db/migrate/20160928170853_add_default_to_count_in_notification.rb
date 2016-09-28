class AddDefaultToCountInNotification < ActiveRecord::Migration
  def change
  	change_column :notifications, :count, :integer, :default=>0
  end
end
