class AddResultPriceToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :result_price, :integer
  end
end
