class GigSong < ApplicationRecord
    belongs_to :gig 
    belongs_to :song


    def details
        "#{self.song.name} - #{self.version} #{self.add_notes}" 
    end

    def version
        if self.original
            "Original Version"
        else
            "#{self.gig.band.name} Version"
        end
    end

    def add_notes
        if self.notes 
            "- Notes: #{self.notes}"
        end
    end

end
