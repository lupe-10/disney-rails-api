class Movie < ApplicationRecord
  has_many :characters, throught: :character_in_movie
  validates :title, :rating, :gender, presence: true
end
