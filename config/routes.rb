Rails.application.routes.draw do
  devise_for :users
  root 'test#index'
  get 'test/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
