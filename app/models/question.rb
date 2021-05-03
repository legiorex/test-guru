class Question < ApplicationRecord
  has_many :answer
  belongs_to :test
end
