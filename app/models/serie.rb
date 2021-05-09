class Serie < ApplicationRecord
  has_many :characters, throught: :character_in_serie
  validates :title, :rating, :gender, presence: true
end
