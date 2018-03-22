class RemoveForeignKey < ActiveRecord::Migration[5.1]
  def change
  	remove_foreign_key :experiences, column: :cover_photo_id
  end
end
