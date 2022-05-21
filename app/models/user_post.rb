class UserPost < ApplicationRecord
  belongs_to :user
  has_many :guestcomment_to_userposts,dependent: :destroy
end
