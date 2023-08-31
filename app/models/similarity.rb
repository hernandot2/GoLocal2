class Similarity < ActiveRecord::Base
  include PgSearch::Model

  pg_search_scope :similarity_like,
                  against: :name,
                  using: {
                    trigram: {
                      word_similarity: true
                    }
                  }

  pg_search_scope :word_similarity_like,
                  against: :name,
                  using: [:trigram]
end
