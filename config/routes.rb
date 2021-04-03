Rails.application.routes.draw do


  resources :musicians, except: [:new, :create] do 
    resources :gigs
  end
  resources :gigs
  resources :songs, only: :index

  get '/stats', to: "musicians#stats"
  get '/', to: "sessions#welcome"
  get '/signup', to: "musicians#new", as: "signup"
  post '/signup', to: "musicians#create"
  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get "auth/:provider/callback", to: "sessions#googleAuth"
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


