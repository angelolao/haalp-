Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  root to: 'pages#index'

  get 'about_us', to: 'pages#about'
  get 'contact_us', to: 'pages#contact'
  get 'corporate', to: 'pages#corporate'

  resources :tasks
  resources :categories

  resources :users, only: [:index, :create] do
    collection do
      get "new_user", to: "users#new_user", as: :new_user
      post "create_user", to: "users#create_user", as: :create_user
    end
  end

  authenticated :user do
    root to: "users#index"
  end

  get 'tasks_history', to: 'tasks#history', as: :tasks_history
end
