class CommentsController < ApplicationController
  # before_action :authenticate_user!

  # def index
  #   @comments = Comment.all
  # end

  # def show
  # end

  # def new
  #   @comment = Comment.new
  # end

  # def edit
  # end

  def create
    # Get the post as an object using param post_id
    @post = Post.find(params[:post_id])

    @comment = @post.comments.new(post_params)
    @comment.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_path(@post), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # def update
  #   respond_to do |format|
  #     if @comment.update(comment_params)
  #       format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @comment }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @comment.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:comment).permit(:body)
    end
end
