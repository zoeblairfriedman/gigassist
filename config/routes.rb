Rails.application.routes.draw do
  resources :bands
  resources :gig_songs
  resources :gigs
  resources :musicians
  resources :songs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
