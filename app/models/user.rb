class User < ApplicationRecord

	has_many :user_tests
	has_many :created_test, class_name: 'Test', foreign_key: :author_id
	has_many :tests, through: :user_test

  validates :email, presence: true 
  validates :email, format: { with: /\A[a-zA-Z0-9._+]+@[a-zA-Zа-яА-Я._+]+\.[a-zа-я]+\z/, message: 'not valid!'}
  

  def tests_by_level(level)
    tests.where(level: level)
  end
end
