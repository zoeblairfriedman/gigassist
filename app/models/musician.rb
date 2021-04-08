class Musician < ApplicationRecord
    has_many :musician_bands
    has_many :bands, through: :musician_bands
    has_many :gigs, through: :bands
    has_many :gig_songs, through: :gigs
    has_many :songs, through: :gigs
    has_secure_password

    validates_uniqueness_of :email
    validates_presence_of :name, :email
    before_validation :name_is_titlecase, on: :create



    private

    def name_is_titlecase
        self.name = self.name.titlecase
    end

  
end

