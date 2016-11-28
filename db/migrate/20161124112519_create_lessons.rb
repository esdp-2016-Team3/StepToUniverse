class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.date :day_of_week
      t.string :time
      t.string :student_name
      t.string :student_id
      t.string :teacher_name
      t.string :teacher_id

      t.timestamps
    end
  end
end
