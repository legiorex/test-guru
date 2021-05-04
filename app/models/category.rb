class Category < ApplicationRecord
  has_many :tests
  scope :take_title, -> { order(:title) }

  validates :title, presence: true
end
