class SerieSerializer < ActiveModel::Serializer
  attributes :id, :gender, :photo, :title, :rating

  has_many :characters
end
