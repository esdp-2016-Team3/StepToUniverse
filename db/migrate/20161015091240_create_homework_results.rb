class CreateHomeworkResults < ActiveRecord::Migration[5.0]
  def change
    create_table :homework_results do |t|

      t.timestamps
    end
  end
end
