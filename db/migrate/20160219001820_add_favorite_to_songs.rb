class AddFavoriteToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :favorite, :boolean
  end
end
