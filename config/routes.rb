Rails.application.routes.draw do
  get '/welcome', to: 'welcomes#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :golfs

  resources :carsharings
end

