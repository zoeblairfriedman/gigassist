class MusicianBand < ApplicationRecord
    belongs_to :musician
    belongs_to :band
end
