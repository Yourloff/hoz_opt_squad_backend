class Product < ApplicationRecord
  dragonfly_accessor :image

  has_one :subcategory
  validates :subcategories_id, presence: true
end
