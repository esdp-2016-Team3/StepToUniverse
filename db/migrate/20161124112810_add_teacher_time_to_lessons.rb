class AddTeacherTimeToLessons < ActiveRecord::Migration[5.0]
  def change
    add_reference :lessons, :teacher_time, foreign_key: true
  end
end
