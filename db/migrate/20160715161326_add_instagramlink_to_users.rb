class AddInstagramlinkToUsers < ActiveRecord::Migration
  def change
    add_column :users, :instagramlink, :string
  end
end
