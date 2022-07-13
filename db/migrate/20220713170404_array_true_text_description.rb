class ArrayTrueTextDescription < ActiveRecord::Migration[7.0]
  def change
    change_table :products do |t|
      t.remove :description
      t.string :description, array: true, default: []
    end
  end
end
