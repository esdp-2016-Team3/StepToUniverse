class AddAttachmentFileToTextFiles < ActiveRecord::Migration
  def self.up
    change_table :text_files do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :text_files, :file
  end
end
