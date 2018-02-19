class ChangeDefaultActiveExperienceToFalse < ActiveRecord::Migration[5.1]
  def change
  	change_column_default(:experiences, :active, false)
  end
end
