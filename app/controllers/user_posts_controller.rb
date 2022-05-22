class UserPostsController < ApplicationController
  def new
    @user_post = UserPost.new
    @user = current_user
  end

  def show
    @user_post = UserPost.find(params[:id])
    @user = current_user
    @guestcomment_to_userpost = GuestcommentToUserpost.new
    @usercomment_to_userpost  = UsercommentToUserpost.new
    # @user_postに紐づいたコメントを格納
    @user_posts = @user_post.guestcomment_to_userpost
  end

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
    # ログインユーザーが新規投稿する際にcreateアクションで使用
    def user_post_params
      params.require(:user_post).permit(:title,:text,:name).merge(user_id: current_user.id)
    end

end
