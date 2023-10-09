class FacilityPost < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :area
  
  has_one_attached :image
  
  validates :image, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validates :introduction, presence: true
  # validates :ster, presence: true
end
