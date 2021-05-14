class Serie < ApplicationRecord
  # has_many :characters, throught: :character_in_serie
  has_one_attached :photo

  validates :title, :rating, :gender, presence: true

  # include Filtrable
  
end
