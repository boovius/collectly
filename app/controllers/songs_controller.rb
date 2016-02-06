class SongsController < ApplicationController
  def create
    if CollectionService.add_song(song_params)
      redirect back
    else
      redirect back
    end
  end

  private

  def song_params
    {
      song: params['song'],
      album: params['album'],
      artist: params['artist'],
    }
  end
end
