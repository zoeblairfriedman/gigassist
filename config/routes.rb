Rails.application.routes.draw do
  resources :musician_bands
  resources :bands
  resources :gig_songs
  resources :gigs

  resources :musicians, except: [:new, :create] do 
    resources :gigs
  end

  resources :songs

  get '/signup', to: "musicians#new", as: "signup"
  post '/signup', to: "musicians#create"
  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


