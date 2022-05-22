class UsercommentToUserpostsController < ApplicationController
  def create
    @user_post = UserPost.find(params[:user_post_id])
    @usercomment_to_userpost = UsercommentToUserpost.create(usercomment_to_userpost_params)
    redirect_to user_post_path(@usercomment_to_userpost.user_post)
  end
  
  private 
    def usercomment_to_userpost_params
      params.require(:usercomment_to_userpost).permit(:name,:text).merge(user_post_id: @user_post.id,user_id: current_user.id)
    end
end
