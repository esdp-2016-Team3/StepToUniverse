class AddUserToProfileAnswers < ActiveRecord::Migration[5.0]
  def change
    add_reference :profile_answers, :user, foreign_key: true
  end
end
