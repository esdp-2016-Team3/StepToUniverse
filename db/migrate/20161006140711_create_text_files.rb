class CreateTextFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :text_files do |t|
      t.string :name
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
