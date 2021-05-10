class Character < ApplicationRecord
  has_many :movies, through: :character_in_movie
  has_many :series, throught: :character_in_serie
  has_one_attached :photo

  validates :name, :weight, :age, :history, presence: true

  include PgSearch::Model
  multisearchable against: %i[name syllabus title history]
end
