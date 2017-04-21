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

  validates :email, :user_type, :password, presence: true

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
