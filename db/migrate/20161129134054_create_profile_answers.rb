class CreateProfileAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_answers do |t|
      t.text :answer

      t.timestamps
    end
  end
end
