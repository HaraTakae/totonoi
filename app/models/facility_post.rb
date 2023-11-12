class FacilityPost < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user
  belongs_to :area
  
  has_one_attached :image
  
  validates :image, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validates :introduction, presence: true
  # validates :ster, presence: true
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
