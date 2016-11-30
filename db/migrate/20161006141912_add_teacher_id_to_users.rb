class AddTeacherIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :teacher, foreign_key: true
  end
end
