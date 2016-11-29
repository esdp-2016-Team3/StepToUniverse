class AddProfileQuestionToProfileAnswers < ActiveRecord::Migration[5.0]
  def change
    add_reference :profile_answers, :profile_question, foreign_key: true
  end
end
