class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new(comment_params)
    binding.pry
  end

  def create
    @comment = Comment.create(comment_params)
  end

  private
    def comment_params
      params.require(:comment).permit(:name,:text).merge(:post_id post.id )
    end
end
