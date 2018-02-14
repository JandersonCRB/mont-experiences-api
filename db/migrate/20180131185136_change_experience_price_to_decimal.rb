class ChangeExperiencePriceToDecimal < ActiveRecord::Migration[5.1]
  def change
  	change_column :experiences, :price, :decimal
  end
end
