class Character < ApplicationRecord
  has_many :movies, through: :character_in_movie
  has_many :series, throught: :character_in_serie
  has_one_attached :photo

  validates :name, :weight, :age, :history, presence: true

  include Filterable

  include PgSearch::Model
  pg_search_scope :global_search,
    against: :name,
    associated_against: {
      movie: :title,
      serie: :title
    },
    using: {
      tsearch: { prefix: true }
    }
end
