class Experience < ApplicationRecord
	has_many                :photos
	has_and_belongs_to_many :categories
	has_many                :bookings
	has_one                 :photo, foreign_key: :cover_photo_id
	belongs_to              :provider

	before_validation :check_provider

	validates :provider, presence: :true
	validates :name,     presence: :true

	scope :active,         -> (active) { where active: active }
	scope :recommended,    -> (recommended) { where recommended: recommended }
	scope :starts_with,    -> (name) { where("name like ?", "#{name}%")}
	scope :order_by,       -> (order_by) { order(order_by)}
	scope :category_query, -> (category) { 
		category = Category.where('name = ?', category).first&.id unless (Float(category) rescue false)
		joins("join categories_experiences on experiences.id = categories_experiences.experience_id").where(["categories_experiences.category_id = ?", category]) 
	}
	def cover_photo
		Photo.find(self.cover_photo_id) if Photo.exists?(self.cover_photo_id)
	end

	def cover_photo= (p)
		self.cover_photo_id = p.id if p.is_a? Photo
		self.cover_photo_id = p if p.is_a? Integer
	end

	private

	def check_provider
		if !self.provider.present?
			self.provider = Provider.find_or_create_by(name: 'Mont')
		end
	end
end
