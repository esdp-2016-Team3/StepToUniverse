class AddAttachmentFileToLibraryFiles < ActiveRecord::Migration[5.0]
  def self.up
    change_table :library_files do |t|
      t.attachment :file
      t.string :pather
    end
  end

  def self.down
    remove_attachment :library_files, :file
  end
end
