class ClientsController < ApplicationController
  before_action :authorized, only: [:auto_login]

  # REGISTER
  def create
    @client = Client.create(client_params)
    if @client.valid?
      token = encode_token({client_id: @client.id})
      render json: {client: @client, token: token}
    else
      render json: {error: "Неверное имя пользователя или пароль"}
    end
  end

  # LOGGING IN
  def login
    @client = Client.find_by(username: params[:username])

    if @client && @client.authenticate(params[:password])
      token = encode_token({client_id: @client.id})
      render json: {client: @client, token: token}
    else
      render json: {error: "Неверное имя пользователя или пароль"}
    end
  end


  def auto_login
    render json: @client
  end

  private

  def user_params
    params.permit(:username, :password, :age)
  end
end
