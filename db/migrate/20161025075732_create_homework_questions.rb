class CreateHomeworkQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :homework_questions do |t|
      t.string :title

      t.timestamps
    end
  end
end
