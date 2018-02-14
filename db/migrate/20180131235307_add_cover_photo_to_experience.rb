class AddCoverPhotoToExperience < ActiveRecord::Migration[5.1]
  def change
  	add_column :experiences, :cover_photo_id, :integer, index: true
  	add_foreign_key :experiences, :photos, column: :cover_photo_id
  end
end
