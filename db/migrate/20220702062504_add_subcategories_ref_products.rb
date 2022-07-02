class AddSubcategoriesRefProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :subcategories, null: false, foreign_key: true
  end
end
