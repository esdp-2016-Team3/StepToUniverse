class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.date :day_of_week
      t.time :time
      t.string :student_id
      t.string :teacher_id

      t.timestamps
    end
  end
end
