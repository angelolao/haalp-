class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :poster, class_name: User, foreign_key: :poster_user_id
end
