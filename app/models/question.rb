class Question < ApplicationRecord
  has_many :answer
  belongs_to :test

  validates :body, presence: true
end
