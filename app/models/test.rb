class Test < ApplicationRecord

	belongs_to :category
  belongs_to :author, class_name: 'User'

	has_many :users, through: :user_test
	has_many :user_test
	has_many :questions
	
  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  validates :level, numericality: { only_integer: true }
  def self.tests_by_category(category)
    Test.joins('INNER JOIN categories ON tests.category_id = categories.id').where(categories: {title: category}).order('tests.title DESC').pluck('tests.title')
  end
end
