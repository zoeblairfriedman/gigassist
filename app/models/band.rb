class Band < ApplicationRecord
    has_many :musician_bands
    has_many :musicians, through: :musician_bands
    has_many :gigs
    has_many :gig_songs, through: :gigs
    has_many :songs, through: :gig_songs
    validates_uniqueness_of :name
    validates_presence_of :name
    
    scope :most_gigs, -> { order(:gigs.length) }
end
