class Gig < ApplicationRecord
    belongs_to :band
    has_many :gig_songs
    has_many :songs, through: :gig_songs
    accepts_nested_attributes_for :songs
    #or should this be accepts_nested_attributes_for :gig_songs

    def band_name=(name)
        self.band = Band.find_or_create_by(name: name)
      end
   
      def band_name
         self.band ? self.band.name : nil
      end

end
