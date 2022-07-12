class BasketProduct < ApplicationRecord
  belongs_to :product
  belongs_to :basket

  private

  def total
    product.price * self.quantity
  end
end
