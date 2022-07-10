class ClientsController < ApplicationController
  before_action :set_client
  before_action :require_login, only: %i[auto_login]

  # REGISTER
  def create
    @client = Client.create(client_params)

    if Client.find_by(email: client_params[:email]) && client_params[:password] != ''
      return render json: { error: "Такой пользователь уже существует" }
    end

    if @client.valid?
      token = encode_token({ email: @client.email, password: @client.password })
      render json: { token: token }
    else
      render json: { error: "Некорректный электронный адрес или пароль" }
    end
  end

  # LOGGING IN
  def login
    if @client && @client.authenticate(params[:password])
      token = encode_token({ email: @client.email, password: @client.password_digest })
      render json: { token: token }
    else
      render json: { error: "Неверный электронный адрес или пароль" }
    end
  end

  def auto_login
    if session_client
      render json: { token: session_client }
    else
      render json: { error: "Пользователь не авторизован" }
    end
  end

  private

  def client_params
    params.permit(:email, :password,
                  :name, :surname, :last_name,
                  :phone, :org, :person_status)
  end

  def set_client
    @client = Client.find_by(email: params[:email])
  end
end
