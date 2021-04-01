class Gig < ApplicationRecord
    belongs_to :band
    has_many :gig_songs
    has_many :songs, through: :gig_songs
    accepts_nested_attributes_for :gig_songs

    def band_name=(name)
        self.band = Band.find_or_create_by(name: name)
      end
   
    def band_name
         self.band ? self.band.name : nil
    end

    def gig_songs_attributes=(hash)
      hash.each do |gs|
        if gs[1][:song_name] != ""
          a = GigSong.new(gs[1])
          self.gig_songs << a
        end
      end
    end


end
