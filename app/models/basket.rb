class Basket < ApplicationRecord
  belongs_to :client
  has_many :basket_products, class_name: 'BasketProduct', foreign_key: 'baskets_id'
end
