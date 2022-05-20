class UserCommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user_comment = UserComment.create(user_comment_params)
    # 上で作成したコメントに紐づくpostのshow画面へ遷移
    redirect_to post_path(@user_comment.post)
  end

  private
    def user_comment_params
      params.require(:user_comment).permit(:text).merge(post_id: @post.id, user_id: current_user.id)
    end
end
