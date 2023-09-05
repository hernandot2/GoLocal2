class Neighborhood < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search, against: [:name], using: {
    tsearch: {prefix: true}
   }
  belongs_to :city
  has_many :locations
  has_many :events
  has_one_attached :photo
end
