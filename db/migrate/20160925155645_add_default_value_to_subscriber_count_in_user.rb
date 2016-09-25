class AddDefaultValueToSubscriberCountInUser < ActiveRecord::Migration
  def change
  	change_column :users, :subscriber_count, :integer, :default => 0
  end
end
