class ClientsController < ApplicationController
  before_action :set_client

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
    begin
      token = request.headers['Authorization'].split(' ')[1]

      # if !token
      #   return render json: { error: "Не авторизован", status: 401 }
      # end
      #
      # req = JWT.decode(token, ENV['SECRET'], true, algorithm: 'HS256')
      #
      # new_token = (JWT.encode req, ENV['SECRET'])
      #
      # byebug

      render json: { token: token }
    rescue JWT::DecodeError
      return render json: { error: "Недопустимая кодировка сегмента" }
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
