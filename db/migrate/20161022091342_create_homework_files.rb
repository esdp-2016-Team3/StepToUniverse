class CreateHomeworkFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :homework_files do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
