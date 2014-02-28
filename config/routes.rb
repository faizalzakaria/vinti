Vinti::Application.routes.draw do
  devise_for :users

  root to: "landing_pages#index"

  get '/coming_soon', :to => "landing_pages#coming_soon", as: :coming_soon
  get '/rank', :to => "rank#index", as: :rank
end
