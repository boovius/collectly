Rails.application.routes.draw do
  root 'users#new'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
end
