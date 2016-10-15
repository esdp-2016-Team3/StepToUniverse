class AddIsDoneToHomeworkAssignments < ActiveRecord::Migration[5.0]
  def change
    add_column :homework_assignments, :is_done, :boolean
  end
end
