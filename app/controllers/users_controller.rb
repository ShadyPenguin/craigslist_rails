class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def new
    @user = User.new
  end

  def login
    user = User.authenticate(login_params)
    if user
      reset_session
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      render 'index'
    end
  end

  def create
    user = User.new(create_params)
    if user.save
      reset_session
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      render 'new'
    end
  end

  def show
  end

  def logout
    reset_session
    redirect_to root_path
  end

  private

    def create_params
      params.require(:user).permit(:username, :email, :password)
    end

    def login_params
      params.require(:user).permit(:email, :password)
    end
end