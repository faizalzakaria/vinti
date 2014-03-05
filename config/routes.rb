Vinti::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root to: "landing_pages#index"
  get '/privacy', :to => "landing_pages#privacy", as: :privacy

  get '/coming_soon', :to => "landing_pages#coming_soon", as: :coming_soon
  get '/rank', :to => "rank#index", as: :rank

  namespace :admin do
    get '/', :to => "landing_pages#index", as: :root
    resources :workouts
  end

  resources :workouts

end
