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
    @user_comment = UserComment.new
    # Postに紐づいたゲストユーザーのコメント(Comment)とPostに紐づいたログインユーザーのコメント(UserComment)のオブジェクトを投稿順に並び替えて格納
    @mixed = (@post.comment + @post.user_comment).sort_by {|record| record.created_at}.reverse!
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:name,:title,:text)
  end

end
