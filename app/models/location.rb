class Location < ApplicationRecord
  include PgSearch::Model
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  pg_search_scope :search, against: [:name], using: {
    tsearch: {prefix: true}
   }
  belongs_to :user
  belongs_to :neighborhood
  has_many :events
  has_many :ratings
  has_one_attached :photo
  has_many :favorites

  def self.categories
    ["Café", "Parque", "Bar", "Loja", "Restaurante", "Museu"]
  end
end

