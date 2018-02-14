class AddFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name,   :string
    add_column :users, :last_name,    :string
    add_column :users, :provider,     :string
    add_column :users, :uid,          :int
    add_column :users, :image,        :string
    add_column :users, :phone_number, :string
    add_column :users, :description,  :text
  end
end
