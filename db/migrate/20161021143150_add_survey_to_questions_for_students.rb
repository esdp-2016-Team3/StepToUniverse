class AddSurveyToQuestionsForStudents < ActiveRecord::Migration[5.0]
  def change
    add_reference :questions_for_students, :survey, foreign_key: true
  end
end
