class PostsController < ApplicationController

  def index
  end

  def new
    @post = Post.new
    # Creates new post object on which to base our forms when we create a new
    # post using the 'new post' form in the 'views/posts/new.html.erb' view.
  end

  def create
    @post = Post.create(post_params)
    redirect_to @post
  end
  # Saves the post to the database.

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end
  # Defines the params we will accept for a post.  In this case a post permits
  # (1) a caption param and (2) an image param.

end
