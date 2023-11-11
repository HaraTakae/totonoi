class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :facility_post
end
