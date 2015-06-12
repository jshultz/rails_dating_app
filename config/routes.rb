Rails.application.routes.draw do

  root 'home#index'

  get 'sessions/new'

  get 'users/new'

  get 'signup'  => 'users#new'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  namespace :dudes do
    resources :dudes
  end

  namespace :dudeettes do
    resources :dudeettes
  end

  resources :users

end
