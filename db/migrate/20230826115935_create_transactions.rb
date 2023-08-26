class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :ticket_no
      t.string :first_name
      t.string :last_name
      t.string :event_name
      t.string :ticket_type
      t.decimal :amount
      t.string :phone

      t.timestamps
    end
  end
end
