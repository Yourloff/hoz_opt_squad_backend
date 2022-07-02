class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :num_order
      t.float :cost
      t.integer :quantity
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
