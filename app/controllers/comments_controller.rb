class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.create(comment_params)
    binding.pry
  end

  private
    def comment_params
      params.require(:comment).permit(:name,:text).merge(post_id: @post.id)
    end
end
