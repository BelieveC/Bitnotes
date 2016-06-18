class AddAttachmentImageToSimages < ActiveRecord::Migration
  def self.up
    change_table :simages do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :simages, :image
  end
end
