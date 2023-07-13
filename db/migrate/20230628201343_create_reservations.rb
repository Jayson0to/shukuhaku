class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.date :checkin
      t.date :checkout
      t.integer :people
      t.references :room, foreign_key: true
      
      t.timestamps
    end
  end
end
