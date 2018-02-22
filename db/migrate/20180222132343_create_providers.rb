class CreateProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :cpf
      t.string :cnpj
      t.string :address
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
