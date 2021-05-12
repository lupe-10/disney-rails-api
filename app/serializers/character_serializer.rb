class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :weight, :history, :photo

  has_many :movies
  has_many :series

  def movies
    ActiveModel::Serializer::CollectionSerializer
      .new(object.movies, each_serializer: MovieSerializer)
  end

  def series
    ActiveModel::Serializer::CollectionSerializer
      .new(object.series, each_serializer: SerieSerializer)
  end
end
