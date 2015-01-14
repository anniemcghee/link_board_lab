class PostsController < ApplicationController

  before_action :is_authenticated?
    # This code is for protected pages and is stored in Application Controller!
    # Adding a chicken and user profile are only protected pages
    # @user = User.find_by_id(session[:user_id])

    # redirect_to login_path unless @user

  def index
    @user = current_user
    @post = Post.all
  end


  def new
    @user = current_user
    @post = Post.new
    # if @post.save
    #   redirect_to '/posts'
    # else
    #   render 'index'
    # end

  end

  def update
    @user = current_user
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
    redirect_to user_path
  end

  def create
      @user = current_user
      @post = @user.posts.create(params.require(:post).permit(:title, :link))
      unless @post.errors.any?
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
    @user = current_user
    @post = @user.posts.find_by_id(params[:user_id])
    not_found unless @post #carries error
  end

  def edit
    @user = current_user
    @post = Post.find_by_id(params[:id]) or not_found
  end

end