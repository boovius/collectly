class Song < ActiveRecord::Base
  validates :title, uniqueness: {scope: :album_id}

  belongs_to :album

  def artist
    album.artist
  end
end
