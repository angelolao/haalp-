class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  attr_accessor \
    :email,
    :name,
    :contact,
    :skype,
    :status,
    :user_type,
    :uid,
    :provider

  class << self
    def omniauth(auth)
      user = where(provider: auth[:provider], uid: auth[:uid]).first
      return user if user.present?

      ActionController::Parameters.permit_all_parameters = true
      args = ActionController::Parameters.new(
        email: auth.info.email,
        password: Devise.friendly_token[0, 20],
        name: auth.info.name
      )
      binding.pry
      User.new(args)
    end
  end
end
