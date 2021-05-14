class Character < ApplicationRecord
  
  # has_many :movies, through: :character_in_movie
  # has_many :series, through: :character_in_serie
  has_one_attached :photo

  validates :name, :weight, :age, :history, presence: true

  # include Filterable

end
