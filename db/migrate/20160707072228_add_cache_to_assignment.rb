class AddCacheToAssignment < ActiveRecord::Migration
  def self.up
    add_column :assignments, :cached_votes_total, :integer, :default => 0
    add_column :assignments, :cached_votes_score, :integer, :default => 0
    add_column :assignments, :cached_votes_up, :integer, :default => 0
    add_column :assignments, :cached_votes_down, :integer, :default => 0
    add_index  :assignments, :cached_votes_total
    add_index  :assignments, :cached_votes_score
    add_index  :assignments, :cached_votes_up
    add_index  :assignments, :cached_votes_down

    # Uncomment this line to force caching of existing votes
    Assignment.find_each(&:update_cached_votes)

    add_column :examnotes, :cached_votes_total, :integer, :default => 0
    add_column :examnotes, :cached_votes_score, :integer, :default => 0
    add_column :examnotes, :cached_votes_up, :integer, :default => 0
    add_column :examnotes, :cached_votes_down, :integer, :default => 0
    add_index  :examnotes, :cached_votes_total
    add_index  :examnotes, :cached_votes_score
    add_index  :examnotes, :cached_votes_up
    add_index  :examnotes, :cached_votes_down

    # Uncomment this line to force caching of existing votes
    Examnote.find_each(&:update_cached_votes)
  end

  def self.down
    remove_column :assignments, :cached_votes_total
    remove_column :assignments, :cached_votes_score
    remove_column :assignments, :cached_votes_up
    remove_column :assignments, :cached_votes_down

    remove_column :examnotes, :cached_votes_total
    remove_column :examnotes, :cached_votes_score
    remove_column :examnotes, :cached_votes_up
    remove_column :examnotes, :cached_votes_down
   end
end
