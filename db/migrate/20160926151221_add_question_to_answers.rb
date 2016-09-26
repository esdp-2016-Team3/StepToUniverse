class AddQuestionToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_reference :answers, :question, foreign_key: true
  end
end
