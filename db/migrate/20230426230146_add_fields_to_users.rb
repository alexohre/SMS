class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_no, :string
    add_column :users, :address, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :state, :string
    add_column :users, :zip_code, :string
  end
end
