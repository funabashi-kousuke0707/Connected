class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_posts
  has_many :user_comments,dependent: :destroy
  has_many :usercomment_to_userposts,dependent: :destroy
end
