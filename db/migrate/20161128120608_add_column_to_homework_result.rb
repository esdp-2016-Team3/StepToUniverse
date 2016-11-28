class AddColumnToHomeworkResult < ActiveRecord::Migration[5.0]
  def change
    add_column :homework_results, :test_result, :text
    add_column :homework_results, :description, :text
  end
end
