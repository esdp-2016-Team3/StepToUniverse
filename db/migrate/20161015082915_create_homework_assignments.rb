class CreateHomeworkAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :homework_assignments do |t|

      t.timestamps
    end
  end
end
