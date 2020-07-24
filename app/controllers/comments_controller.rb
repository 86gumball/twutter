class CommentsController < ApplicationController
  def create
    # Get the post as an object using param post_id
    @post = Post.find(params[:post_id])

    @comment = @post.comments.new(post_params)
    @comment.user = current_user

    if @post.save
      redirect_to post_path(@post), notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @comment.destroy
    redirect_to posts_url, notice: 'Comment was successfully destroyed.'
  end

  private
    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:comment).permit(:body)
    end
end
