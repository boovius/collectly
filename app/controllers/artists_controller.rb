class ArtistsController < ApplicationController
  def index
    @artists = Artist.where(user: current_user)
  end

  def show
    @artist = Artist.find(params[:id])
  end
end
