class Event < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search, against: [:title], using: :trigram
  belongs_to :user
  belongs_to :location
end
