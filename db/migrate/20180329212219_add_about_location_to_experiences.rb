class AddAboutLocationToExperiences < ActiveRecord::Migration[5.1]
  def change
    add_column :experiences, :about_location, :string
  end
end
