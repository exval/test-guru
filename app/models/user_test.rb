class UserTest < ApplicationRecord
  before_action  

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question'

  def current_question
  	current_question
  end

  def next_question
  	
  end
end
