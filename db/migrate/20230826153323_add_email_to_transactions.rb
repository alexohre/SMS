class AddEmailToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :email, :string
  end
end
