class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true

  scope :used_tests, ->(level) { Test.joins(:tests_users).where(level: level) }
end
