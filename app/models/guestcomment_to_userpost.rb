class GuestcommentToUserpost < ApplicationRecord
  belongs_to :user_post,  dependent: :destroy
end
