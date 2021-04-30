class Test < ApplicationRecord
  has_many :questions
  belongs_to :category
  belongs_to :user, foreign_key: :author_id

  has_many :tests_users
  has_many :users, through: :tests_users

  def self.by_category(category_name)
    order('tests.id DESC').joins(:category).where('categories.title' => category_name).pluck(:title)
  end
end
