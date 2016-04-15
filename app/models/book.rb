class Book < ApplicationRecord
  belongs_to :user
  has_many :involvement
  has_many :participant, through: :involvement, source: :user
  validates :title, format: { with: /\A[\w\s\d]+\z/, message: "only allow letters, numbers and space" }
  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :member, presence: true, numericality: { greater_than_or_equal_to: 1 }

  def involve(user)
    involvement.create(user_id: user.id)
  end

  def devolve(user)
  	involvement.find_by(user_id: user.id).destroy
  end
end
