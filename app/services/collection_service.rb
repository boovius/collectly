class CollectionService
  class << self
    def add_song hash
      artist = Artist.find_or_create_by(name: hash[:artist].downcase)
      album = Album.find_or_create_by(title: hash[:album], image_url: hash[:album_image_url], artist: artist)
      song = Song.new(title: hash[:song], album: album)
      song.save
    end
  end
end
