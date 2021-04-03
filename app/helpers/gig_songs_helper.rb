module GigSongsHelper

    def details(gs)
        "#{gs.song.name} - #{gs.version} #{gs.add_notes}" 
    end

end
