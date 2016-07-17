class PostsController < ApplicationController

  before_action :authenticate_user!

  def index
    @posts = Post.all
  # Collects all of the posts in our Post model so we can use them in the index.
  end

  def new
    @post = current_user.posts.build
    # Builds new current_user.posts object on which to base our forms when we
    # create a new post using the 'new post' form in the
    # 'views/posts/new.html.erb' view.
  end

  def create
    @post = current_user.posts.build(post_params)
    # Builds a new current_user.posts object to be saved or not to the database
    # depending on the outcome of the below logic.
    if @post.save
      flash[:success] = "Your post has been created."
      redirect_to posts_path
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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Post updated hombre"
      redirect_to(root_path)
    else
      flash[:alert] = "Something is wrong with your form!"
      redirect_to(root_path)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Problem solved! Post deleted."
    redirect_to(root_path)
  end

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
