class UsersController < ApplicationController

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password))
      if @user.save
        session[:user_id] = @user.id
        redirect_to posts_path, :success => "You have just logged in"
        #flash success is a BOOTSTRAP term related to "alert-success" class.
        #Look at erb file index to show how it's called via the first param / key
        #I created a PARTIAL for all flash messages! See Partials + index view to connect dots
        redirect_to '/posts'
      else
        render 'new'
      end
  end


end