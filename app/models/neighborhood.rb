class Neighborhood < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search, against: [:name]
  belongs_to :city
  has_many :locations
end
