class Band < ApplicationRecord
    has_many :musician_bands
    has_many :musicians, through: :musician_bands
    has_many :gigs
    has_many :gig_songs, through: :gigs
    has_many :songs, through: :gig_songs
end
