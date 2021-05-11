# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'cleaning database'
User.destroy_all
Character.destroy_all
Movie.destroy_all
Series.destroy_all


MOVIES = [{
  title: "Clouds",
  rating: "5",
  gender: "Drama"
},{
  title: "Spies in Disguise",
  rating: "4",
  gender: "Comedy"
},{
  title: "Ford v Ferrari",
  rating: "3",
  gender: "Drama"
},{
  title: "Onward",
  rating: "4",
  gender: "Fantasy Adventure"
},{
  title: "The Call of the Wild ",
  rating: "4",
  gender: "Adventure"
},{
  title: "Avengers: Endgame",
  rating: "5",
  gender: "Superhero"
},
]

SERIES = [{
  title: "Fight club",
  rating: "5",
  gender: "Drama"
}, {
  title: "Gone girl",
  rating: "4",
  gender: "Suspence"
},{
  title: "The Curious Case of Benjamin Button",
  rating: "3",
  gender: "Fantastic romantic drama"
},{
  title: "The Social Network",
  rating: "4",
  gender: "Biographical drama"
},{
  title: "Panic Room",
  rating: "4",
  gender: "Thriller"
},{
  title: "Seven",
  rating: "5",
  gender: "Psychologycal thriller"
},
]

CHARACTERS = [{
  name: "Fight club",
  weight: "5",
  age: "Drama",
  history: ""
},