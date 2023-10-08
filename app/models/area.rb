class Area < ApplicationRecord
  has_many :facility_posts, dependent: :destroy
  
  validates :name, presence: true
  
end
