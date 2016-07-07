class AddCacheToQpaper < ActiveRecord::Migration
   def self.up
    add_column :requests, :cached_votes_total, :integer, :default => 0
    add_column :requests, :cached_votes_score, :integer, :default => 0
    add_column :requests, :cached_votes_up, :integer, :default => 0
    add_column :requests, :cached_votes_down, :integer, :default => 0
    add_index  :requests, :cached_votes_total
    add_index  :requests, :cached_votes_score
    add_index  :requests, :cached_votes_up
    add_index  :requests, :cached_votes_down

    # Uncomment this line to force caching of existing votes
    Request.find_each(&:update_cached_votes)

    add_column :qpapers, :cached_votes_total, :integer, :default => 0
    add_column :qpapers, :cached_votes_score, :integer, :default => 0
    add_column :qpapers, :cached_votes_up, :integer, :default => 0
    add_column :qpapers, :cached_votes_down, :integer, :default => 0
    add_index  :qpapers, :cached_votes_total
    add_index  :qpapers, :cached_votes_score
    add_index  :qpapers, :cached_votes_up
    add_index  :qpapers, :cached_votes_down

    # Uncomment this line to force caching of existing votes
    Qpaper.find_each(&:update_cached_votes)
  end

  def self.down
    remove_column :requests, :cached_votes_total
    remove_column :requests, :cached_votes_score
    remove_column :requests, :cached_votes_up
    remove_column :requests, :cached_votes_down

    remove_column :qpapers, :cached_votes_total
    remove_column :qpapers, :cached_votes_score
    remove_column :qpapers, :cached_votes_up
    remove_column :qpapers, :cached_votes_down
   end
end
