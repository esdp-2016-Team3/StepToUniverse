class AddHomeworkToTextFile < ActiveRecord::Migration[5.0]
  def change
    add_reference :text_files, :homework, foreign_key: true
  end
end
