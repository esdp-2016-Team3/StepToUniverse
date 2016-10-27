class CreateHomeworkStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :homework_statuses do |t|
      t.string :status

      t.timestamps
    end
  end
end
