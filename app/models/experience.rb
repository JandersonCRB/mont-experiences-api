class Experience < ApplicationRecord
	has_many                :photos
	has_and_belongs_to_many :categories
	has_many                :bookings
	has_one                 :photo, foreign_key: :cover_photo_id

	validates :name, presence: :true

	def cover_photo
		Photo.find(self.cover_photo_id) if Photo.exists?(self.cover_photo_id)
	end

	def cover_photo= (p)
		self.cover_photo_id = p.id if p.is_a? Photo
		self.cover_photo_id = p if p.is_a? Integer
	end

	def self.get_active
		self.where("active = ?", true)
	end

	def self.get_recommended
		self.where("recommended = ?", true)
	end
end
