class CreateTeacherTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :teacher_times do |t|
      t.string :time
      t.string :day_of_week
      t.string :student_id
      t.string :teacher_id

      t.timestamps
    end
  end
end
