class CreateHomeworkAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :homework_answers do |t|
      t.string :title
      t.boolean :is_correct

      t.timestamps
    end
  end
end
