class ChangeColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :gigs, :date, :date
  end
end
