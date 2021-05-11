class Character < ApplicationRecord
  has_many :movies, through: :character_in_movie
  has_many :series, throught: :character_in_serie
  has_one_attached :photo

  validates :name, :weight, :age, :history, presence: true

  include Filterable

  include PgSearch::Model
  pg_search_scope :participation, associated_against: {
    movies: :title,
    series: :title
  }
  multisearchable against: %i[name syllabus history]
end
