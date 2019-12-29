Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :characters
  resources :places do
    get 'combat', to: 'places#combat'
    get 'engage', to: 'places#engage'
    get 'fuir', to: 'places#fuir'
  end

    # Sidekiq Web UI, only for admins.
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

end
