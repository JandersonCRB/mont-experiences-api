class AddFieldsToExperience < ActiveRecord::Migration[5.1]
  def change
    add_column :experiences, :duration, :string
    add_column :experiences, :language, :string
  end
end
