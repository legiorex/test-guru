class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true

  def used_tests(level)
    tests.where(level: level)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
