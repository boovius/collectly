Rails.application.routes.draw do
  root 'users#home'
  post '/songs' => 'songs#create'

  get '/login'  => 'sessions#login'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
end
