class CreateGigSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :gig_songs do |t|
      t.boolean :original
      t.text :notes
      t.integer :gig_id
      t.integer :song_id

      t.timestamps
    end
  end
end
