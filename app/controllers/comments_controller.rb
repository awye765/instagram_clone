class CommentsController < ApplicationController

  before_action :set_post

  def create
    @comment = @post.comments.build(comment_params)
    # Builds a new comment using the parmas and assigns a user_name based on the
    # value of the currently signed in user.
    @comment.user_id = current_user.id

    if @comment.save
      respond_to do | format |
        format.html { redirect_to root_path }
        format.js
      end
    else
      flash[:alert] = "Check the comment form, something went horribly wrong"
      render root_path
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    if @comment.user_id == current_user.id
      @comment.destroy
      flash[:success] = "Comment deleted :("
      redirect_to root_path
    else
      flash[:alert] = "That doesn't belong to you!"
      redirect_to root_path
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
