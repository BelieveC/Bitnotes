class AddAttachmentImageToCimages < ActiveRecord::Migration
  def self.up
    change_table :cimages do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :cimages, :image
  end
end
