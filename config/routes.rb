Picard::Application.routes.draw do
  resources :notes
  resources :encounters
  match 'tagged' => 'encounters#tagged', :as => 'tagged'
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
end