class AddTelephoneToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :telephone, :string, :limit => 17
  end
end
