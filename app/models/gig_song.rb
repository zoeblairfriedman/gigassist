class GigSong < ApplicationRecord
    belongs_to :gig 
    belongs_to :song

    scope :by_date, -> { order(date: :asc) }
    scope :unique, -> { group(:song_id) }
    scope :by_count, -> { count(song: :desc) }
    scope :not_over, -> { where("date > ?", DateTime.now)}
    
    def song_name=(name)
        self.song = Song.find_or_create_by(name: name) unless name == ""
    end
   
    def song_name
        self.song ? self.song.name : nil
    end

    #candidate for helper module
    def details
        "#{self.song.name} - #{self.version} #{self.add_notes}" 
    end

    def version
        self.original ? "Original Version" : "#{self.gig.band.name} Version"
    end

    def add_notes
        if self.notes != ""
            "- Notes: #{self.notes}"
        end
    end

    def gs_date
        self.gig.date
    end

    def show_date
        gs_date.strftime("%a %B %d, %Y")   
    end

end
