class AddColumnToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :is_available?, :boolean, default: true
  end
end
