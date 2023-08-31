class City < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search, against: [:name],  using: {
    tsearch: {prefix: true},
  }
  has_many :neighborhoods
  has_one_attached :photo
end
