class ClientsController < ApplicationController
  #before_action :authorized, only: [:auto_login]

  # REGISTER
  def create
    @client = Client.create(client_params)
    if @client.valid?
      token = encode_token({ client_id: @client.id })
      render json: { client: @client, token: token }
    else
      render json: { error: "Пользователь с таким email уже зарегистрирован" }
    end
  end

  # LOGGING IN
  def login
    @client = Client.find_by(email: params[:email])

    if @client && @client.authenticate(params[:password])
      token = encode_token({ client_id: @client.id })
      render json: { client: @client, token: token }
    else
      render json: { error: "Неверный электронный адрес или пароль" }
    end
  end

  def auto_login
    render json: @client
  end

  private

  def client_params
    params.permit(:email, :password,
                  :name, :surname, :last_name,
                  :phone, :org, :person_status)
  end
end
