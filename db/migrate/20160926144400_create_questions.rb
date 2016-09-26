class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.text :content
      t.boolean :is_active

      t.timestamps
    end
  end
end
