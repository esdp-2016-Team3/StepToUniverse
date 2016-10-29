class AddColumnToHomework < ActiveRecord::Migration[5.0]
  def change
    add_column :homeworks, :type_homework, :string
  end
end
