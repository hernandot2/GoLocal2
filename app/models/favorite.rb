class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :location
  belongs_to :event
end
