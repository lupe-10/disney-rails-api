class Character < ApplicationRecord
  has_many :character_in_movie
  has_many :character_in_serie
  validates :name, :weight, :age, :history, presence: true
end
