class Song < ApplicationRecord
    has_many :gigsongs
    has_many :gigs, through: :gigsongs
end
