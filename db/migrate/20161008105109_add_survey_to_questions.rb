class AddSurveyToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_reference :questions, :survey, foreign_key: true
  end
end
