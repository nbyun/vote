Rails.application.routes.draw do
  namespace :admin do
    root to: 'home#index'
    get 'home/index'

    resources :players
    resources :tickets
  end

  root to: 'vote#index'
  resources :vote do
    member do
      post :vote
    end
  end
  devise_for :admins, controllers: {sessions: 'admin/sessions'}, only: :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
