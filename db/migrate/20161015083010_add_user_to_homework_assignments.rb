class AddUserToHomeworkAssignments < ActiveRecord::Migration[5.0]
  def change
    add_reference :homework_assignments, :user, foreign_key: true
  end
end
