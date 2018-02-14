class AddPriceToExperience < ActiveRecord::Migration[5.1]
  def change
  	add_column :experiences, :price, :float
  end
end
