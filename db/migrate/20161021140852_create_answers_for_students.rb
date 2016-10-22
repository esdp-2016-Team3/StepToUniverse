class CreateAnswersForStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :answers_for_students do |t|
      t.string :title
      t.boolean :is_correct

      t.timestamps
    end
  end
end
