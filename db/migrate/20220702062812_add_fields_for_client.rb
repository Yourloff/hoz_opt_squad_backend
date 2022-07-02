class AddFieldsForClient < ActiveRecord::Migration[7.0]
  def change
    change_table :clients do |t|
      t.change :username, :string, index: { unique: true }
      t.string :name
      t.string :surname
      t.string :last_name
      t.string :phone, index: { unique: true }
      t.string :email, index: { unique: true }
      t.string :org
      t.string :person_status
    end
  end
end
