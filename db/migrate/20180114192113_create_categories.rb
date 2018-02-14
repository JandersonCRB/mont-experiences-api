class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

    create_table :categories_experiences, id: false do |t|
  		t.belongs_to :experience, index: true
  		t.belongs_to :category, index: true
  	end
  end
end