class ClientsController < ApplicationController
  before_action :set_client
  before_action :authorized, only: %i[auto_login]

  # REGISTER
  def create
    @client = Client.create(client_params)

    if Client.find_by(email: client_params[:email]) && client_params[:password] != ''
      return render json: { error: "Такой пользователь уже существует" }
    end

    if @client.valid?
      token = encode_token({ client_id: @client.id })
      render json: { token: token }
    else
      render json: { error: "Некорректный электронный адрес или пароль" }
    end
  end

  # LOGGING IN
  def login
    if @client && @client.authenticate(params[:password])
      token = encode_token({ client_id: @client.id })
      render json: { token: token }
    else
      render json: { error: "Неверный электронный адрес или пароль" }
    end
  end

  def auto_login
    token = encode_token({ client_id: @client.id })
    render json: { token: token }
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
