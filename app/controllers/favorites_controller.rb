class FavoritesController < ApplicationController
  def create
    media_type = params['mediaType']
    media = Object.const_get media_type.capitalize
    id = params['mediaId']
    instance = media.find id

    prev_value = instance.favorite
    current_value = !prev_value

    color = current_value ? 'gold' : 'black'

    if instance.update_attributes(favorite: current_value)
      render json: {message: 'success', color: color}, status: 200
    else
      render json: {error: instance.errors.full_messages}, status: 422
    end
  end
end
