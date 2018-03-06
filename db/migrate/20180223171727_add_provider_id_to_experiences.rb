class AddProviderIdToExperiences < ActiveRecord::Migration[5.1]
  def change
    add_reference :experiences, :provider, foreign_key: true
  end
end
