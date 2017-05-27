Rails.application.routes.draw do
  root to: 'urls#index'
  get "/:short_url", to: "urls#show"
  get "shortened/:short_url", to: "urls#shortened", as: :shortened
  resources :urls, only: :create
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
