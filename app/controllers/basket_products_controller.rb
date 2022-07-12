class BasketProductsController < ApplicationController
  def show
    basket = Basket.find(1)
    render json: basket.basket_products
  end

  def add
    @client = Client.first
    @basket = @client.basket
  end
end
