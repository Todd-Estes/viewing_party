Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get "/registration", to: "users#new"
  post "/registration", to: "users#create"
  get '/dashboard', to: 'users#show'

  post '/login', to: 'sessions#login'
  get '/logout', to: 'sessions#logout'

  resources :discover, only: %i[index]

  resources :search, only: %i[index]
end
