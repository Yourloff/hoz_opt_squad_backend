class AddCategoryRefSubcategory < ActiveRecord::Migration[7.0]
  def change
    add_reference :subcategories, :categories, null: false, foreign_key: true
  end
end
