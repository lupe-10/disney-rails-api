
json.extract! @character, :id, :name, :history, :weight, :age, @character.movies, @character.series
json.movies @character.movies do |movie|
  json.extract! movie, :id, :title, :rating
end