class UsersController < ApplicationController
  def show
    @user = User.find(session[:user_id]) if logged_in?
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      reset_session
      log_in @user
      render json: {user: @user, status: 'successfully created new user' }
    else
      render json: { error: @user.errors }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
