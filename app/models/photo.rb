class Photo < ApplicationRecord
  belongs_to :experience

  # belongs_to :cover_photo, class_name: 'Experience'
  
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
