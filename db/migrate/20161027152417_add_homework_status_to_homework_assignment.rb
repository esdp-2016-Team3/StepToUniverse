class AddHomeworkStatusToHomeworkAssignment < ActiveRecord::Migration[5.0]
  def change
    add_reference :homework_assignments, :homework_status, foreign_key: true
  end
end
