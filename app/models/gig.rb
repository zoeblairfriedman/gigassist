class Gig < ApplicationRecord
    belongs_to :band
    has_many :gig_songs
    has_many :songs, through: :gig_songs
end
