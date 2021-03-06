class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    if post
      User.find(session[:user_id]).posts << post
      redirect_to user_path(session[:user_id])
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    @category = Category.find(@post.category_id)
    render 'show'
  end

  private

    def post_params
      params.require(:post).permit(:title, :body, :category_id)
    end

end
