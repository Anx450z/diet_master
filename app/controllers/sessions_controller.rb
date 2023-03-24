class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      token = Jwt.encode({ user_id: user.id }, 'your_secret_here', 'HS256')
      render json: { token: token }
    else
      render json: { error: 'Invalid login credentials' }, status: 401
    end
  end
end
