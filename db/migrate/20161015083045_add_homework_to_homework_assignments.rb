class AddHomeworkToHomeworkAssignments < ActiveRecord::Migration[5.0]
  def change
    add_reference :homework_assignments, :homework, foreign_key: true
  end
end
