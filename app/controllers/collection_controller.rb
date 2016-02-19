class CollectionController < ApplicationController
  def search
    query   = params['query']
    songs   = Song.where("title ILIKE :search", search: query)
    albums  = Album.where("title ILIKE :search", search: query)
    artists = Artist.where("name ILIKE :search", search: query)

    results = {
      albums: albums,
      artists: artists,
      songs: songs,
    }

    render json: results, status: 200
  end
end
