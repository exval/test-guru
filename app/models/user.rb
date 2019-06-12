class User < ApplicationRecord

	has_many :user_tests
	has_many :created_test, class_name: 'Test', foreign_key: :author_id
	has_many :tests, through: :user_test
	
  def tests_by_level(level)
    Test.where(level: level).joins('INNER JOIN user_tests ON tests.id = user_tests.test_id').where(user_tests: {user_id: self.id})
  end
end
