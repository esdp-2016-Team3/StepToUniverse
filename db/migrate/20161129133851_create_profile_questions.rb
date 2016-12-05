class CreateProfileQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_questions do |t|
      t.string :question

      t.timestamps
    end
  end
end
