class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise \
    :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable,
    :omniauthable,
    omniauth_providers: [:facebook]

  TYPES = %w(worker poster admin)

  LOCATIONS = [
    "Taguig City",
    "Makati City",
    "Quezon City",
    "Pasig City",
    "Pasay City"
  ]

  validates :email, :user_type, :password, presence: true

  TYPES.each do |type|
    define_method "#{type}?" do
      self.user_type == type
    end
  end

  def rating
    ratings = Comment.where(user_id: self.id).pluck(:rating)
    ratings.empty? ? 0 : ratings.sum / ratings.size
  end

  class << self
    def omniauth(auth)
      user = where(provider: auth[:provider], uid: auth[:uid]).first

      return user if user.present?

      ActionController::Parameters.permit_all_parameters = true
      args = ActionController::Parameters.new(
        name: auth.info.name,
        email: auth.info.email,
        uid: auth[:uid]
      )
      User.new(args.permit(:email, :name, :uid))
    end
  end
end
