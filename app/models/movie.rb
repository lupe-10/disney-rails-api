class Movie < ApplicationRecord
  has_many :characters, throught: :character_in_movie
  has_one_attached :photo

  validates :title, :rating, :gender, presence: true

  include Filterable

  include PgSearch::Model
  multisearchable against: %i[title syllabus]

end
