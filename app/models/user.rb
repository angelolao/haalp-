class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  TYPES = %w(worker poster admin)

  TYPES.each do |type|
    define_method "#{type}?" do
      self.user_type == type
    end
  end
end
