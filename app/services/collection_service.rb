class CollectionService
  class << self
    def add_song hash
      Song.create(title: hash[:song])
    end
  end
end
