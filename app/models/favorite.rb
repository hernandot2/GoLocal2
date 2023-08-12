class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :local
  belongs_to :event
end
