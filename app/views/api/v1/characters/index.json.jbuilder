json.array! @characters do |character|
  json.extract! character, :id, :name
end