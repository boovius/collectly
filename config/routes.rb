Rails.application.routes.draw do
  root 'users#home'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login'  => 'sessions#login'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  post '/songs' => 'songs#create'

  get '/artists'     => 'artists#index'
  get '/artists/:id' => 'artists#show'
  get '/albums'      => 'albums#index'
  get '/albums/:id'  => 'albums#show'
end
