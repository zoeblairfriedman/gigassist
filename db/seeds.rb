# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

musicians = Musician.create([{name: "Zoe Friedman"}, 
{name: "Tony Calabro"}, 
{name: "Nick Cambell"}, 
{name: "Drew Thurlow"}, 
{name: "Kwame Remy"}, 
{name: "Patty Nilson"}])

songs = Song.create([{name: "Pour Some Sugar"}, 
{name: "Love Bites"}, 
{name: "34+35"}, 
{name: "Dancing On My Own"}, 
{name: "Shout At The Devil"}, 
{name: "Kickstart My Heart"},
{name: "Carry Me"}, 
{name: "Rainbow In The Dark"},
{name: "Take My Breath Away"},
])

bands = Band.create([{name: "Dum Cheeta"}, 
{name: "Nick Cambell Band"}, 
{name: "Girls, Girls, Girls"}, 
{name: "White Wedding"}, 
{name: "Thrilldriver"}, 
{name: "VIPER"}, 
{name: "Russ Bennet Band"}])

#can i have multiple musician IDs here? i.e. musician_ids: => [1, 3]
#how do i do date??
gigs = Gig.create([
{venue: "Ryland Inn", date:  , band_id: 2, musician_id: 1},
{venue: "Ryland Inn", date:  , band_id: 2, musician_id: 3},


])

gigsongs = 
