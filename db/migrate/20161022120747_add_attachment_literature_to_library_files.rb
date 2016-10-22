class AddAttachmentLiteratureToLibraryFiles < ActiveRecord::Migration[5.0]
  def self.up
    change_table :library_files do |t|
      t.attachment :literature
      t.string :path_file
    end
  end

  def self.down
    remove_attachment :library_files, :literature
  end
end
