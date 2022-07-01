class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :username, uniq: true, presence: true
      t.string :password_digest

      t.timestamps
    end
  end
end
