class AddUserToLibraryFiles < ActiveRecord::Migration[5.0]
  def change
    add_reference :library_files, :user, foreign_key: true
  end
end
