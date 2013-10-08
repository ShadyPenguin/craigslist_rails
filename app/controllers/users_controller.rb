class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
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

  private

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end