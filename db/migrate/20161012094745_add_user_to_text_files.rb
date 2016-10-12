class AddUserToTextFiles < ActiveRecord::Migration[5.0]
  def change
    add_reference :text_files, :user, foreign_key: true
  end
end
