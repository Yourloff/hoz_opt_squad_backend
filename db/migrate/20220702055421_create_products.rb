class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :article_number
      t.string :title
      t.float :price
      t.string :image_uid

      t.timestamps
    end
  end
end
