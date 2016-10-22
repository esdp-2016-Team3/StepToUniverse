class AddQuestionsForStudentToAnswersForStudents < ActiveRecord::Migration[5.0]
  def change
    add_reference :answers_for_students, :questions_for_student, foreign_key: true
  end
end
