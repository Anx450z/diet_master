class ApplicationController < ActionController::Base
  before_action :authenticate_request

  private
  def authenticate_request
    header = request.header['Authorization']
    header = header.split(' ').last if header
    begin
      decode = JWT.decode(header, 'your_secret_here', true, algorithm: 'HS256')
      @current_user_id = decoded[0]['user_id']
    rescue JWT::DecodeError
      render json: { error: 'Invalid token' }, status: 401
    end
  end

  def current_user
    @current_user ||= User.find_by(id: @current_user_id)
  end
end
