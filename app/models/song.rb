class Song < ApplicationRecord
    has_many :gig_songs
    has_many :gigs, through: :gig_songs
  
end
