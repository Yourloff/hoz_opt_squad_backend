class BasketProductsController < ApplicationController
  before_action :require_login
  before_action :get_client_from_token

  def show
    if session_client
      all_items = @client.basket.basket_products
      render json: all_items
    else
      render json: { error: "Пользователь не авторизован" }
    end
  end

  def add
    @client.basket.basket_products.create(basket_product_params)
    render json: { message: "Добавлено" }
  end

  def remove
    @client.basket.basket_products.find(basket_product_params[:id]).destroy
    render json: { message: "Удалено" }
  end

  private

  def get_client_from_token
    decoded_hash = JWT.decode(session_client, ENV['SECRET'], true, algorithm: 'HS256')
    client_email = decoded_hash[0]['email']
    @client = Client.find_by(email: client_email)
  end

  def basket_product_params
    params.require(:basket_product).permit(:id, :products_id, :baskets_id, :quantity)
  end
end
