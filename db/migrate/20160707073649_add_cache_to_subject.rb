class AddCacheToSubject < ActiveRecord::Migration
   def self.up
    add_column :subjects, :cached_votes_total, :integer, :default => 0
    add_column :subjects, :cached_votes_score, :integer, :default => 0
    add_column :subjects, :cached_votes_up, :integer, :default => 0
    add_column :subjects, :cached_votes_down, :integer, :default => 0
    add_index  :subjects, :cached_votes_total
    add_index  :subjects, :cached_votes_score
    add_index  :subjects, :cached_votes_up
    add_index  :subjects, :cached_votes_down

    # Uncomment this line to force caching of existing votes
    Subject.find_each(&:update_cached_votes)

    add_column :colleges, :cached_votes_total, :integer, :default => 0
    add_column :colleges, :cached_votes_score, :integer, :default => 0
    add_column :colleges, :cached_votes_up, :integer, :default => 0
    add_column :colleges, :cached_votes_down, :integer, :default => 0
    add_index  :colleges, :cached_votes_total
    add_index  :colleges, :cached_votes_score
    add_index  :colleges, :cached_votes_up
    add_index  :colleges, :cached_votes_down

    # Uncomment this line to force caching of existing votes
    College.find_each(&:update_cached_votes)
  end

  def self.down
    remove_column :subjects, :cached_votes_total
    remove_column :subjects, :cached_votes_score
    remove_column :subjects, :cached_votes_up
    remove_column :subjects, :cached_votes_down

    remove_column :colleges, :cached_votes_total
    remove_column :colleges, :cached_votes_score
    remove_column :colleges, :cached_votes_up
    remove_column :colleges, :cached_votes_down
   end
end
