class Product < ApplicationRecord
  extend Dragonfly::Model
  dragonfly_accessor :image
end
