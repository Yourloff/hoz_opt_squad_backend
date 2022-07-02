class Product < ApplicationRecord
  extend Dragonfly::Model
  dragonfly_accessor :image

  belongs_to :order
  has_one :subcategory
end
