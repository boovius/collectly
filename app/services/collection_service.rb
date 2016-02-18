class CollectionService
  class << self
    def add_song hash
      artist = Artist.find_or_create_by(name: hash[:artist].downcase)
      album = Album.find_or_create_by(title: hash[:album], artist: artist)
      Song.create(title: hash[:song], album: album)
    end
  end
end
