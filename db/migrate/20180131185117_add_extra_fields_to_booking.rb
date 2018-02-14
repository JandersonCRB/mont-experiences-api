class AddExtraFieldsToBooking < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :cost, :decimal
    add_column :bookings, :adults, :int
    add_column :bookings, :children, :int
  end
end
