class Book < ApplicationRecord
  belongs_to :user
  validates :title, format: { with: /\A[\w\s\d]+\z/, message: "only allow letters, numbers and space" }
  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :member, presence: true, numericality: { greater_than_or_equal_to: 1 }
end