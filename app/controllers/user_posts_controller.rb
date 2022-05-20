class UserPostsController < ApplicationController
  def new
    @user_post = UserPost.new
    @user = current_user.name
  end

  # def show
  #   @user_post = UserPost.find(params[:id])
  #   @user_comment = UserComment.new(user_post_params)
  #   # @comments = @post.comment
  # end

  def create
    UserPost.create(user_post_params)
    redirect_to root_path
  end

  def destroy
    @user_post = UserPost.find(params[:id])
    @user_post.destroy
    redirect_to root_path
  end


  private
    def user_post_params
      params.require(:user_post).permit(:title,:text,:name).merge(user_id: current_user.id)
    end

end
