class AddFblinkAndTwitterLinkAndPinterestLinkToUser < ActiveRecord::Migration
  def change
    add_column :users, :fblink, :string
    add_column :users, :twitterlink, :string
    add_column :users, :pinterestlink, :string
  end
end
