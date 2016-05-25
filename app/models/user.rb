class User < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :involvements
  has_many :payment
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    # :confirmable, :lockable,
    :timeoutable, :omniauthable, omniauth_providers: [:twitter]

  validates :name, format: { with: /\A[a-zA-Z]+[\-\w\d]*\z/, message: "only allow letters and numbers" }

  class << self
    def from_oauth(auth)
      where(provider: auth[:provider], uid: auth[:uid]).first_or_create do |user|
        user.provider = auth[:provider]
        user.uid = auth[:uid]
        user.name = auth[:info][:nickname]
      end
    end

    def new_with_session(params, session)
      if session["devise.user_attributes"]
        debugger
        new(session["devise.user_attributes"]) do |user|
          user.attributes = params
          debugger
          user.valid?
        end
      else
        super
      end
    end
  end

end
