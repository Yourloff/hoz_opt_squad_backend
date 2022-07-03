class DeleteColumnUsernameClient < ActiveRecord::Migration[7.0]
  def change
    remove_column :clients, :username
  end
end
