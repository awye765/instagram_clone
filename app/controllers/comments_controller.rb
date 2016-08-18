class CommentsController < ApplicationController

  before_action :set_post

  def index
    @comments = @post.comments.order("created_at ASC")

    respond_to do | format |
      format.html { render layout: !request.xhr? }
    end
    # Returns all comments for a post in ASCENDING order.  We are also requesting
    # the application's LAYOUT view but ensuring it is ONLY rendered as part of
    # of this request IF the request is NOT made with AJAX.  In other words, the
    # layout html will NOT be returned during an AJAX call, thereby returning
    # only the comments and NOT the navbar etc.
  end

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
      respond_to do | format |
        format.html { redirect_to root_path }
        format.js
      end
    # else
    #   flash[:alert] = "That doesn't belong to you!"
    #   redirect_to root_path
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
