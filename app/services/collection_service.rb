class CollectionService
  class << self
    def add_song hash
      artist = Artist.find_or_create_by(name: hash[:artist])
      album = Album.find_or_create_by(title: hash[:album])
      Song.create(title: hash[:song], album: album)
    end
  end
end
