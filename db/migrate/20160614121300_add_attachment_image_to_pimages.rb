class AddAttachmentImageToPimages < ActiveRecord::Migration
  def self.up
    change_table :pimages do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :pimages, :image
  end
end
