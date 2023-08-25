class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.time :start_time
      t.integer :duration

      t.timestamps
    end
  end
end
