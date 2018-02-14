class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :experience, foreign_key: true
      t.string     :name
      t.string     :email
      t.string     :phone
      t.text       :dates
      t.text       :comments

      t.timestamps
    end
  end
end
