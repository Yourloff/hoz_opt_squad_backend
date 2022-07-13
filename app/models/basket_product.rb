class BasketProduct < ApplicationRecord
  belongs_to :product, foreign_key: 'products_id'
  belongs_to :basket, foreign_key: 'baskets_id'
end
