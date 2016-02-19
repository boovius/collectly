class CollectionService
  class << self
    def add_song(hash, user)
      artist = Artist.find_or_create_by(
        name: hash[:artist].downcase, user: user
      )
      album = Album.find_or_create_by(
        title: hash[:album],
        image_url: hash[:album_image_url],
        artist: artist,
        user: user
      )
      song = Song.new(
        title: hash[:song], album: album, user: user
      )
      song.save
    end
  end
end
