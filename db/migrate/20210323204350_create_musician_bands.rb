class CreateMusicianBands < ActiveRecord::Migration[6.1]
  def change
    create_table :musician_bands do |t|
      t.integer :band_id
      t.integer :musician_id
      t.timestamps
    end
  end
end
