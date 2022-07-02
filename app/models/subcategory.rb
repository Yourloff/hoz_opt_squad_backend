class Subcategory < ApplicationRecord
  extend Dragonfly::Model
  dragonfly_accessor :image
end
