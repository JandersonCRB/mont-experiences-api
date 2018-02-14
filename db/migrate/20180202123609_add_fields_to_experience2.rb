class AddFieldsToExperience2 < ActiveRecord::Migration[5.1]
  def change
  	add_column :experiences, :cancelation, :string
  	add_column :experiences, :payment_method, :string
  	add_column :experiences, :calendar, :string
  	add_column :experiences, :accessibility, :boolean
  end
end
