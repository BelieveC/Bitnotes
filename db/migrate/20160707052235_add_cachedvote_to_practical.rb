class AddCachedvoteToPractical < ActiveRecord::Migration
  def self.up
    add_column :practicals, :cached_votes_total, :integer, :default => 0
    add_column :practicals, :cached_votes_score, :integer, :default => 0
    add_column :practicals, :cached_votes_up, :integer, :default => 0
    add_column :practicals, :cached_votes_down, :integer, :default => 0
    add_index  :practicals, :cached_votes_total
    add_index  :practicals, :cached_votes_score
    add_index  :practicals, :cached_votes_up
    add_index  :practicals, :cached_votes_down

    # Uncomment this line to force caching of existing votes
    Practical.find_each(&:update_cached_votes)
  end

  def self.down
    remove_column :practicals, :cached_votes_total
    remove_column :practicals, :cached_votes_score
    remove_column :practicals, :cached_votes_up
    remove_column :practicals, :cached_votes_down
  end
end
