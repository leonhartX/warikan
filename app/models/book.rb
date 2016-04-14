class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :member, presence: true, numericality: { greater_than_or_equal_to: 1 }
end