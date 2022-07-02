class Subcategory < ApplicationRecord
  extend Dragonfly::Model
  dragonfly_accessor :image

  has_one :category
  has_many :products, foreign_key: :subcategories_id
end
