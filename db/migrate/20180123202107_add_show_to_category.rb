class AddShowToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :show, :boolean, :default => false
  end
end
