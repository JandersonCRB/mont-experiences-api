class Provider < ApplicationRecord
	has_many :managements
	has_many :users, through: :managements, dependent: :destroy
end
