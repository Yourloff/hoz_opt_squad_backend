class CreateSubcategories < ActiveRecord::Migration[7.0]
  def change
    create_table :subcategories do |t|
      t.string :title
      t.string :image_uid

      t.timestamps
    end
  end
end
