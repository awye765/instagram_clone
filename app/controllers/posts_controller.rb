class PostsController < ApplicationController

  def index
  end

  def new
    @post = Post.new
    # Creates new post object on which to base our forms when we create a new
    # post using the 'new post' form in the 'views/posts/new.html.erb' view.
  end

end
