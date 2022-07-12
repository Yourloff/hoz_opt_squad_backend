class RemoveCostAddQuantity < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :cost
    add_column :basket_products, :quantity, :integer
  end
end
