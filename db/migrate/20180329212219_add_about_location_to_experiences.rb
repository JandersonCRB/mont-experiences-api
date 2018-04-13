class AddAboutLocationToExperiences < ActiveRecord::Migration[5.1]
  def change
    add_column :experiences, :about_location, :string unless column_exists?(:experiences, :about_location)
  end
end
