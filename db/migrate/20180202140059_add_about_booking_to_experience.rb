class AddAboutBookingToExperience < ActiveRecord::Migration[5.1]
  def change
    add_column :experiences, :about_booking, :text
  end
end
