class Category < ApplicationRecord
  has_many :subcategories, dependent: :destroy, foreign_key: :categories_id
end
