class AddUnqueIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :unique_id, :string
    add_index :users, :unique_id, unique: true
  end
end
