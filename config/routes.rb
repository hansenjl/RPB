Rails.application.routes.draw do
  root 'sessions#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

   get '/signup' => 'users#new'
  post '/signup' => 'users#create'



  resources :workouts
  resources :trainings
  resources :races
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
