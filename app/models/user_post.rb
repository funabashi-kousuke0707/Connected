class UserPost < ApplicationRecord
  belongs_to :user
  has_many :guestcomment_to_userpost,dependent: :destroy
  has_many :usercomment_to_userpost,dependent: :destroy
end
