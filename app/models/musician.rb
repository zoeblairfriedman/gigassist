class Musician < ApplicationRecord
    has_many :musician_bands
    has_many :bands, through: :musician_bands
    has_many :gigs, through: :bands
    has_many :songs, through: :gigs
end

