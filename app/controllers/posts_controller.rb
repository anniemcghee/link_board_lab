class PostsController < ApplicationController

  before_action :is_authenticated?
    # This code is for protected pages and is stored in Application Controller!
    # Adding a chicken and user profile are only protected pages
    # @user = User.find_by_id(session[:user_id])

    # redirect_to login_path unless @user

  def index
    @post = Post.all
  end


  def new
    @post = Post.new(params.require(:post).permit(:title, :link))
    if @post.save
      redirect_to '/posts'
    else
      render 'index'
    end

  end

  def update
   @post = Post.find(params[:id]) or not_found
    if @post.update_attributes(params.require(:post).permit(:title, :link))
      redirect_to '/posts'
    else
      render 'index'
    end
  end

  def destroy
    p = Post.find_by_id(params[:id]) or not_found
    p.destroy
    redirect_to posts_path
  end

  def create
      @post = Post.new(params.require(:post).permit(:title, :link))
      if @post.save
        flash[:success] = "Your post has been added."
        #flash success is a BOOTSTRAP term related to "alert-success" class.
        #Look at erb file index to show how it's called via the first param / key
        #I created a PARTIAL for all flash messages! See Partials + index view to connect dots
        redirect_to '/posts'
      else
        render 'new'
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
    not_found unless @post #carries error
  end

  def edit
    @post = Post.find_by_id(params[:id]) or not_found
  end

end