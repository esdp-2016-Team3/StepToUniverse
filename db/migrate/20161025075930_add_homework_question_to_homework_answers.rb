class AddHomeworkQuestionToHomeworkAnswers < ActiveRecord::Migration[5.0]
  def change
    add_reference :homework_answers, :homework_question, foreign_key: true
  end
end
