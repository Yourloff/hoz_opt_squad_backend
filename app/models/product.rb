class Product < ApplicationRecord
  extend Dragonfly::Model
  dragonfly_accessor :image

  has_one :subcategory
  validates :subcategories_id, presence: true
end
