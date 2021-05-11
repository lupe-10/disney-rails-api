class CharacterSerializer < ActiveModel::Serializer
  attributes :id :name :age :weight :history :photo

  has_many :movies
  has_many :series

  def movies_list
    @character.movies.map do |movie|
      {
        title: movie.title,
        gender: movie.gender,
        rating: movie.rating
      }
    end
  end

  
  def series_list
    @character.series.map do |serie|
      {
        title: serie.title,
        gender: serie.gender,
        rating: serie.rating
      }
    end
  end
end
