class Musician < ApplicationRecord
    has_many :musician_bands
    has_many :bands, through: :musician_bands
    has_many :gigs, through: :bands
    has_many :gig_songs, through: :gigs
    has_many :songs, through: :gigs
    has_secure_password

    validates_uniqueness_of :name
    validates_presence_of :name

  
end

