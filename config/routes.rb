Vinti::Application.routes.draw do
  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks",
    :registrations      => "users/registrations"
  }

  resources :users, :only => [] do
    member do
      get '/profile', :to => "users/profiles#index", as: :profile_page
    end
  end

  root to: "landing_pages#index"
  get '/privacy', :to => "landing_pages#privacy", as: :privacy

  get '/coming_soon', :to => "landing_pages#coming_soon", as: :coming_soon
  get '/rank', :to => "rank#index", as: :rank

  namespace :admin do
    get '/', :to => "landing_pages#index", as: :root
    resources :workouts
    resources :challenges
    resources :settings
  end

  resources :workouts

end
