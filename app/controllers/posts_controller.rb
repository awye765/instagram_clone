class PostsController < ApplicationController

  def index
    @posts = Post.all
  # Collects all of the posts in our Post model so we can use them in the index.
  end

  def new
    @post = Post.new
    # Creates new post object on which to base our forms when we create a new
    # post using the 'new post' form in the 'views/posts/new.html.erb' view.
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "Your post has been created."
      redirect_to @post
    # If the post saves, flash a success message and redirect back to the index
    # view for posts.
    else
      flash[:alert] = "Halt, you fiend! You need an image to post here!"
      render :new
    # If the post does NOT save, flash error message and re-render the new
    # view so user can resubmit with correct requirements.
    end
  end
  # Creates new database row representing the post object and saves that row
  # to the database.

  def show
    @post = Post.find(params[:id])
  end
  # Displays a post.

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end
  # Defines the params we will accept for a post.  In this case a post permits
  # (1) a caption param and (2) an image param.

end

# This bare controller (i.e. without any methods) was created by the rails cmd
# => rails g controller posts
# => rails g controller [name of controller]