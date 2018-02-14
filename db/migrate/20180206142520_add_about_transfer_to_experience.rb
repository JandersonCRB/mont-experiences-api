class AddAboutTransferToExperience < ActiveRecord::Migration[5.1]
  def change
    add_column :experiences, :about_transfer, :text
  end
end
