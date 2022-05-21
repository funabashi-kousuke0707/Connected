class UserPost < ApplicationRecord
  belongs_to :user
  has_many :guestcomment_to_userpost,dependent: :destroy
end
