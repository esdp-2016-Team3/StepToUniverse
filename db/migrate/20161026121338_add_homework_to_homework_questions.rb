class AddHomeworkToHomeworkQuestions < ActiveRecord::Migration[5.0]
  def change
    add_reference :homework_questions, :homework, foreign_key: true
  end
end
