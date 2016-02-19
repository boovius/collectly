Rails.application.routes.draw do
  root 'users#home'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login'  => 'sessions#login'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/search'     => 'collection#search'
  post '/songs'     => 'songs#create'
  post '/favorites' => 'favorites#create'

  get '/artists'     => 'artists#index'
  get '/artists/:id' => 'artists#show'
  get '/albums'      => 'albums#index'
  get '/albums/:id'  => 'albums#show'
  get '/songs'       => 'songs#index'
  get '/songs/:id'   => 'songs#show'
end
