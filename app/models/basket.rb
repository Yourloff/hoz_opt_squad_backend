class Basket < ApplicationRecord
  belongs_to :client
  has_many :basket_products, class_name: 'BasketProduct'
end
