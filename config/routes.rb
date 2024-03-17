Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users
  
  resources :collections do
    resource :favorites, only: [:create, :destroy]
  end
  
  get "home/help" => "home#help"
  get "home/terms" => "home#terms"
  
  get "up" => "rails/health#show", as: :rails_health_check
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
