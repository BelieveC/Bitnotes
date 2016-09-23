class AddSubscriberCountToUser < ActiveRecord::Migration
  def change
    add_column :users, :subscriber_count, :int
  end
end
