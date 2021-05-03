class Test < ApplicationRecord
  has_many :questions
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  has_many :tests_users
  has_many :users, through: :tests_users

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..) }

  scope :by_category, lambda { |category_name|
                        order('tests.id DESC').joins(:category).where('categories.title' => category_name).pluck(:title)
                      }

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level,
                                  message: 'there must be a different level of difficulty' }

  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
