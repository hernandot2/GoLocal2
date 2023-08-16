class Location < ApplicationRecord
  belongs_to :user
  belongs_to :neighborhood
  has_many :events
  has_many :ratings
end
