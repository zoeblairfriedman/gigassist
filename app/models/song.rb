class Song < ApplicationRecord
    has_many :gig_songs
    has_many :gigs, through: :gig_songs

    before_validation :name_is_titlecase, on: :create

    private

    def name_is_titlecase
      self.name = self.name.titlecase
    end

  
end
