class CreateHomeworks < ActiveRecord::Migration[5.0]
  def change
    create_table :homeworks do |t|
      t.string :title
      t.boolean :is_deleted
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
