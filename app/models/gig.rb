class Gig < ApplicationRecord
    belongs_to :band
    belongs_to :musician
    has_many :gigsongs
    has_many :songs, through: :gigsongs
end
