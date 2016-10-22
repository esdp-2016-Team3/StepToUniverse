class AddHomeworkToHomeworkFiles < ActiveRecord::Migration[5.0]
  def change
    add_reference :homework_files, :homework, foreign_key: true
  end
end
