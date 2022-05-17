class UserPostsController < ApplicationController
  def new
    @user_post = UserPost.new
    @user = current_user.name
  end

  def create
    UserPost.create(user_post_params)
    redirect_to root_path
  end

  private
    def user_post_params
      params.require(:user_post).permit(:title,:text,:name).merge(user_id: current_user.id)
    end

end
