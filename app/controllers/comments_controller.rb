class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @cat = Cat.find(@post.cat_id).slug

    @comment = @post.comment.new(comment_params)
    if(@comment.save)
      redirect_to show_path(:post_slug => @post.slug, :cat_slug => @cat)
    else
      render plain:  @comment.errors.full_messages
    end
  end

  private def comment_params
    params.require(:comment).permit(:username, :body, :post_id)
  end

end
