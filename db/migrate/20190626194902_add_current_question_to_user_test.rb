class AddCurrentQuestionToUserTest < ActiveRecord::Migration[5.2]
  def change
  	add_reference :user_tests, :current_question, foreign_key: true
  end
end
