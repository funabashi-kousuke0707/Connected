class Post < ApplicationRecord
  has_many :comment,dependent: :destroy
  has_many :user_comment,dependent: :destroy
end
