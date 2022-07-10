class BasketProduct < ApplicationRecord
  belongs_to :products
  belongs_to :baskets
end
