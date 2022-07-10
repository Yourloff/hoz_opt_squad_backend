class ApplicationController < ActionController::API
  before_action :require_login

  def encode_token(payload)
    JWT.encode(payload, ENV['SECRET'])
  end

  def auth_header
    # { Authorization: 'Bearer <token>' }
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      # header: { 'Authorization': 'Bearer <token>' }
      begin
        JWT.decode(token, ENV['SECRET'], true, algorithm: 'HS256')
      rescue JWT::DecodeError
        []
      end
    end
  end

  def session_client
    decoded_hash = decoded_token
    if !decoded_hash.empty?
      client_email = decoded_hash[0]['email']
      @client = Client.find_by(email: client_email)
      payload = { email: @client.email, password: @client.password_digest }
      encode_token(payload)
    else
      nil
    end
  end

  def logged_in?
    !!session_client
  end

  def require_login
    render json: { message: "Пожалуйста авторизуйтесь" }, status: :unauthorized unless logged_in?
  end
end
