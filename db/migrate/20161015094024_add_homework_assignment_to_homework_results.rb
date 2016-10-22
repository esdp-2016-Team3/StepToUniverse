class AddHomeworkAssignmentToHomeworkResults < ActiveRecord::Migration[5.0]
  def change
    add_reference :homework_results, :homework_assignment, foreign_key: true
  end
end
