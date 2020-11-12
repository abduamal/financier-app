Rails.application.routes.draw do
  root to: 'pages#index'
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end
  resources :payments
  resources :accounts do
    resources :transactions
  end
  #specifies the registrations controller
  devise_for :users, :controllers => {:registrations => "registrations",:omniauth_callbacks => 'users/omniauth'}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
