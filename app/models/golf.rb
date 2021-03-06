class Golf < ApplicationRecord
  has_many :golfcomments
  has_one_attached :golf_image

  validates :name, 
  presence: true
  validates :description, 
  presence: true
  validates :course_type, 
  presence: true
  validates :price_range, 
  presence: true
  validates :lat, 
  presence: true
  validates :long, 
  presence: true
  
end
