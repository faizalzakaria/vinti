Vinti::Application.routes.draw do
  devise_for :users

  root to: "landing_pages#rules"

  get '/coming_soon', :to => "landing_pages#coming_soon", as: :coming_soon
end
