class PostsController < ApplicationController
 before_action :authenticate_user!, except: [:index, :cats, :show]

  def index
    @posts = Post.all
  end

  def cats
    @cat = Cat.find_by_slug!(params[:cat_slug]).id
    @posts = Post.where(:cat_id => @cat)
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find_by_slug!(params[:post_slug])
    @comments = Comment.where(:post_id => @post.id)
  end

  def create
    @post = Post.new(post_params)
    if(@post.save)
      redirect_to show_path(:post_slug => @post.slug, :cat_slug => Cat.find(@post.cat_id).slug)
    else
      render 'add'
    end
  end

  private def post_params
    params.require(:post).permit(:title, :slug, :subtitle, :text, :image, :publish, :cat_id)
  end

end
