Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  authenticated :user do
    root to: "users#index"
  end

  root to: 'pages#index'

  get 'about_us', to: 'pages#about'
  get 'contact_us', to: 'pages#contact'
  get 'corporate', to: 'pages#corporate'

  resources :categories
  resources :offers
  resources :tasks do
    resources :offers, only: :index do
      collection do
        put "aktion", to: "offers#aktion", as: :aktion
      end
    end
  end

  resources :users, only: [:show, :index, :create] do
    collection do
      get "new_user", to: "users#new_user", as: :new_user
      post "create_user", to: "users#create_user", as: :create_user
    end
  end

  get 'tasks_history', to: 'tasks#history', as: :tasks_history
  get 'mock_payment', to: 'users#mock_payment', as: :mock_payment
  patch 'accept_payment', to: 'users#accept_payment', as: :accept_payment
end
