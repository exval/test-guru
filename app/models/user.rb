class User < ApplicationRecord

	has_many :test_passages
	has_many :created_test, class_name: 'Test', foreign_key: :author_id
	has_many :tests, through: :test_passages

  validates :email, presence: true 
  validates :email, format: { with: /\A[a-zA-Z0-9._+]+@[a-zA-Zа-яА-Я._+]+\.[a-zа-я]+\z/, message: 'not valid!'}
  

  def test_passage(test)
  	test_passages.order(id: :desc).find_by(test_id: test.id) 
  end

  def tests_by_level(level)
    tests.where(level: level)
  end
end
