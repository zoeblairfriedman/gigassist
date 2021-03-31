# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



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

musicians = Musician.create([{name: "Zoe Friedman", password: "password"}, 
{name: "Tony Calabro", password: "password"}, 
{name: "Nick Cambell", password: "password"}, 
{name: "Drew Thurlow", password: "password"}, 
{name: "Kwame Remy", password: "password"}, 
{name: "Patty Nilson", password: "password"}])

MusicianBand.create([
    {musician_id: 1, band_id: 1},
    {musician_id: 1, band_id: 2},
    {musician_id: 1, band_id: 3},
    {musician_id: 1, band_id: 4},
    {musician_id: 1, band_id: 5}
])

#how do i do date??
gigs = Gig.create([
{venue: "Ryland Inn", band_id: 2, date: DateTime.new(2021,9,2,17)},
{venue: "University Club", band_id: 2, date: DateTime.new(2021,9,3,17)},
{venue: "Whiskey-a-go-go", band_id: 3, date: DateTime.new(2022,9,4,17)},
{venue: "Mercury Lounge", band_id: 1, date: DateTime.new(2021,9,5,17)}
])



gigsongs = GigSong.create([
    {original: false, notes: "slower than the original", song_id: 3, gig_id: 1},
    {original: true, song_id: 4, gig_id: 1},
    {original: true, song_id: 3, gig_id: 2},
    {original: true, notes: "Funny full-band intro", song_id: 1, gig_id: 4},
])

#relationships aren't working
