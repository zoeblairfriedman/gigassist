class CreateGigs < ActiveRecord::Migration[6.1]
  def change
    create_table :gigs do |t|
      t.string :venue
      t.integer :band_id
      t.datetime :date
      t.integer :musician_id

      t.timestamps
    end
  end
end
