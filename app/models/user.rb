class User < ApplicationRecord

	has_many :user_tests
	has_many :created_test, class_name: 'Test', foreign_key: :author_id
	has_many :tests, through: :user_test
	
	scope :tests_by_level_return, -> (level) { joins }

  validates :email, presence: true
  

  def tests_by_level(level)
    tests.where(level: level)
  end
end
