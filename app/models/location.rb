class Location < ApplicationRecord
  belongs_to :user
  belongs_to :neighborhood
  has_many :events
  has_many :ratings

  def self.categories
    ["Café", "Parque", "Bar", "Loja", "Ar Livre", "Museu"]
  end
end
