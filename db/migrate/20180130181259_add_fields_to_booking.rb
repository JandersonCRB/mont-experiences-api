class AddFieldsToBooking < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :address, :string
    add_column :bookings, :complement, :string
  end
end
