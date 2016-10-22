class CreateQuestionsForStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :questions_for_students do |t|
      t.string :title

      t.timestamps
    end
  end
end
