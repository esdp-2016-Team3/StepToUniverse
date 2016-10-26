class AddSurveyToHomeworkQuestions < ActiveRecord::Migration[5.0]
  def change
    add_reference :homework_questions, :survey, foreign_key: true
  end
end
