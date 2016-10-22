class AddAttachmentFileToHomeworkFiles < ActiveRecord::Migration[5.0]
  def self.up
    change_table :homework_files do |t|
      t.attachment :file
      t.string :pather
    end
  end

  def self.down
    remove_attachment :homework_files, :file
  end
end
