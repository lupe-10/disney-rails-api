class Movie < ApplicationRecord
  has_many :characters, throught: :character_in_movie
  has_one_attached :photo

  validates :title, :rating, :gender, presence: true

  include Filterable

  include PgSearch::Model
  pg_search_scope :search_by_title_and_synopsis,
  against: :title,
  using: {
    tsearch: { prefix: true } 
  }

end
