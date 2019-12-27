Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :characters
  resources :places do
    get 'combat', to: 'places#combat'
    get 'engage', to: 'places#engage'
  end
end
