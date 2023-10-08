class Comment < ApplicationRecord
  belongs_to :facility_post
  belongs_to :user
  
  validates :comment, presence: true
end
