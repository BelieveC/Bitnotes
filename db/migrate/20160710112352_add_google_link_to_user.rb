class AddGoogleLinkToUser < ActiveRecord::Migration
  def change
    add_column :users, :googlelink, :string
  end
end
