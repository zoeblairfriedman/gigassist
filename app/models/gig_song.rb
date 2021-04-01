class GigSong < ApplicationRecord
    belongs_to :gig 
    belongs_to :song

    def song_name=(name)
        self.song = Song.find_or_create_by(name: name) unless name == ""
    end
   
    def song_name
        self.song ? self.song.name : nil
    end

    def details
        "#{self.song.name} - #{self.version} #{self.add_notes}" 
    end

    def version
        self.original ? "Original Version" : "#{self.gig.band.name} Version"
    end

    def add_notes
        if self.notes 
            "- Notes: #{self.notes}"
        end
    end

    def date
        self.gig.date
    end

end
