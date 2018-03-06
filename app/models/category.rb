class Category < ApplicationRecord
	has_and_belongs_to_many :experiences

	validates :name, presence: :true

	scope :show, -> (show) { where show: show }
	scope :starts_with, -> (name) { where("name like ?", "#{name}%")}
end
