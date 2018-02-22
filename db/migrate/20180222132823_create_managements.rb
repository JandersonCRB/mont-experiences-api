class CreateManagements < ActiveRecord::Migration[5.1]
  def change
    create_table :managements do |t|
      t.string :role
      t.references :user, foreign_key: true
      t.references :provider, foreign_key: true

      t.timestamps
    end
  end
end
