Rails.application.routes.draw do
  root to: 'pages#index'
  resources :payments
  resources :accounts do
    resources :transactions
  end
  #specifies the registrations controller
  devise_for :users, :controllers => {:registrations => "registrations"}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
