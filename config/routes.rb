Picard::Application.routes.draw do
  resources :notes
  resources :encounters
  match 'tagged' => 'encounters#tagged', :as => 'tagged'
  authenticated :user do
    root :to => 'encounters#index'
  end
  root :to => "encounters#index"
  devise_for :users
end