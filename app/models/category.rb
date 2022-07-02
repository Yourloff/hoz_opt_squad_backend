class Category < ApplicationRecord
  has_many :subcategories, foreign_key: :categories_id
end
