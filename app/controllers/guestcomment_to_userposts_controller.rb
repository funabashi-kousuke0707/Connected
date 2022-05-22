class GuestcommentToUserpostsController < ApplicationController
  def create
    @user_post = UserPost.find(params[:user_post_id])
    @guestcomment_to_userpost = GuestcommentToUserpost.create(guestcomment_to_userpost_params)
    redirect_to user_post_path(@guestcomment_to_userpost.user_post)
  end

  private 
    def guestcomment_to_userpost_params
      params.require(:guestcomment_to_userpost).permit(:name,:text).merge(user_post_id: @user_post.id)
    end
end
