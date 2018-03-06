class NormalizeUserTokens < ActiveRecord::Migration[5.1]
  def change
  end
  def data
  	User.all.each do |user|
  		user.save
  	end
  end
end
