class Management < ApplicationRecord
  belongs_to :user
  belongs_to :provider


  scope :owner,    -> { where(role: "owner") }
  scope :employee, -> { where(role: "employee") }
end
