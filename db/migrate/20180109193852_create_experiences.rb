class CreateExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :experiences do |t|
      t.string  :name
      t.string  :location
      t.float   :latitude
      t.float   :longitude
      t.boolean :has_transfer
      t.text    :description
      t.text    :itinerary
      t.text    :observation

      t.timestamps
    end
  end
end
