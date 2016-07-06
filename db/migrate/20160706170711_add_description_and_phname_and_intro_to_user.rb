class AddDescriptionAndPhnameAndIntroToUser < ActiveRecord::Migration
  def change
    add_column :users, :description, :text
    add_column :users, :phname, :string
    add_column :users, :intro, :text
  end
end
