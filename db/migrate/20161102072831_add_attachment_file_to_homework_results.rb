class AddAttachmentFileToHomeworkResults < ActiveRecord::Migration[5.0]
  def self.up
    change_table :homework_results do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :homework_results, :file
  end
end
