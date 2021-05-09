class Character < ApplicationRecord
  has_many :movies, through: :character_in_movie
  has_many :series, throught: :character_in_serie
  validates :name, :weight, :age, :history, presence: true
end
