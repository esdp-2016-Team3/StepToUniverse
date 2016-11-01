class AddColumnToHomeworkResult < ActiveRecord::Migration[5.0]
  def change
    add_column :homework_results, :description, :text
  end
end
