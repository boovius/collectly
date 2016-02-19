class AlbumsController < ApplicationController
  def index
    @albums = Album.where(user: current_user)
  end

  def show
    @album = Album.find(params[:id])
  end
end
