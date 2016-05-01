class PostsController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      # render, don't redirect - so that you can see the text still.
      render 'new' # new.html.erb
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  # rails 4 strong params - have to define which params you will allow
  # security? don't really know
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
