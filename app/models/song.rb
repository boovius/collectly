class Song < ActiveRecord::Base
  validates :title, uniqueness: {scope: :album_id}

  belongs_to :album
  belongs_to :user

  def artist
    album.artist if album.present?
  end
end
