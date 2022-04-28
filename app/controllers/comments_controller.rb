class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
  end

  private
    def comment_params
      params.require(:comment).permit(:name,:text).merge(:post_id post.id )
    end
end
