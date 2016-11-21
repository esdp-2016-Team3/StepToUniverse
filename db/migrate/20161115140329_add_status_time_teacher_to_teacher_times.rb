class AddStatusTimeTeacherToTeacherTimes < ActiveRecord::Migration[5.0]
  def change
    add_reference :teacher_times, :status_time_teacher, foreign_key: true
  end
end
