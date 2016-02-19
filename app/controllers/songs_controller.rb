class SongsController < ApplicationController
  def index
    @songs = Song.where(user: current_user)
  end

  def create
    if CollectionService.add_song(song_params, current_user)
      flash[:success] = 'song added successfully!'
      redirect_to :back
    else
      flash[:error] = 'unable to add song'
      redirect_to :back
    end
  end

  private

  def song_params
    {
      song: params['song'].strip,
      album: params['album'].strip,
      artist: params['artist'].strip,
      album_image_url: params['album_image_url'].strip,
    }
  end
end
