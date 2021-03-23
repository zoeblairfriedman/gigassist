class Musician < ApplicationRecord
    has_many :gigs 
    has_many :songs, through: :gigs
    has_many :bands, through: :gigs
end
