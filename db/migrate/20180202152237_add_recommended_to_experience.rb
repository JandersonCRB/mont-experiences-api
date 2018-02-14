class AddRecommendedToExperience < ActiveRecord::Migration[5.1]
  def change
    add_column :experiences, :recommended, :boolean
  end
end
