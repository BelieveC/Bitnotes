class AddAttachmentImageToEimages < ActiveRecord::Migration
  def self.up
    change_table :eimages do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :eimages, :image
  end
end
