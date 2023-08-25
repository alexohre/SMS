class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :name
      t.decimal :price
      t.integer :ticket_type
      t.integer :vip_seats
      t.integer :regular_seats
      t.references :event, null: false, foreign_key: {on_delete: :cascade} 

      t.timestamps
    end
  end
end
