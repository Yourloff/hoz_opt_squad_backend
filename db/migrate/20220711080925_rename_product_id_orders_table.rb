class RenameProductIdOrdersTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :orders, :product_id, :basket_product_id
  end
end
