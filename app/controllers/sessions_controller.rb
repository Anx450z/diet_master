class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user&.authenticate(params[:user][:password])
      reset_session
      log_in user
      render json: { user:, status: 'logged in successfully' }, status: 200
    else
      render json: { error: user.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    log_out
    render json: { status: 'user logged out' }, status: 200
  end
end
