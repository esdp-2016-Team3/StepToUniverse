class AddIsCheckedToHomeworkResults < ActiveRecord::Migration[5.0]
  def change
    add_column :homework_results, :is_checked, :boolean
  end
end
