class AddAttachmentImageToScreens < ActiveRecord::Migration
  def self.up
    change_table :screens do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :screens, :image
  end
end
