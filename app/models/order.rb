class Order < ApplicationRecord
  belongs_to :basket_product
  belongs_to :client

  private

  def total
    basket_product.product.price
  end
end
