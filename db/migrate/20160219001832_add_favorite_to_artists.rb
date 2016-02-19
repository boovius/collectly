class AddFavoriteToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :favorite, :boolean
  end
end
