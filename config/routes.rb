Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'

  get 'about_us', to: 'pages#about'
  get 'contact_us', to: 'pages#contact'
  get 'corporate', to: 'pages#corporate'

  resources :tasks
  resources :users, only: [:index]
end
