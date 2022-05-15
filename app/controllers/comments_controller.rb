class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.create(comment_params)
    redirect_to post_path(@comment.post)
  end

  private
    def comment_params
      params.require(:comment).permit(:name,:text).merge(post_id: @post.id)
    end
end
