class CollectionService
  class << self
    def add_song hash
      album = Album.find_or_create_by(title: hash[:album])
      Song.create(title: hash[:song], album: album)
    end
  end
end
