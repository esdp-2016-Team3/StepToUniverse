class CreateStatusTimeTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :status_time_teachers do |t|
      t.string :status_time

      t.timestamps
    end
  end
end
