class UsercommentToUserpost < ApplicationRecord
  belongs_to :user_post,  dependent: :destroy
  belongs_to :user,  dependent: :destroy
end
