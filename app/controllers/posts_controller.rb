class PostsController < ApplicationController
  
  def index
    @posts = Post.all
    @user_posts = UserPost.all
    @mixed = (@posts + @user_posts).sort_by {|record| record.created_at}.reverse!
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comment
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  private
  def post_params
    params.require(:post).permit(:name,:title,:text)
  end

end
